`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:14 02/29/2016 
// Design Name: 
// Module Name:    SDCardReader 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SDCardReader(
    clk,
    command,
    argument,
    SDData,
    sendCmd,
    misoPin,
    mosiPin,
    ssPin,
    dataReady
    );
    
    input clk;
    input [0:5] command;
    input [31:0] argument;
    output reg [0:7] SDData[511:0];  //44100 samples/sec * 16 bits/sample * 30 seconds
    input sendCmd;
    input misoPin;
    input mosiPin;
    input ssPin;
    output reg dataReady;
    

    reg[0:5] commandReg;
    reg misoReg;
    reg mosiReg;
    reg ssReg;
    
    wire rst;
    reg[39:0] spicmd;
    reg startSendingSignal;
    reg busySignal;
    reg rcvdResponseSignal;
    reg[0:7] response;
    
    int i;
    int j;
    reg[0:5] cmd0 = 0;
    reg[0:31] cmd0Arg = 0;
    reg[0:7] cmd0Crc = 95;
    reg[0:7] cmd0Resp;

    reg[0:5] cmd8 = 8;
    reg[0:31] cmd8Arg = 426;
    reg[0:7] cmd8Crc = 95;
    reg[0:7] cmd8Resp;

    reg[0:5] cmd55 = 55;
    reg[0:31] cmd55Arg = 0;
    reg[0:7] cmd55Crc = 1;
    reg[0:7] cmd55Resp;

    reg[0:5] cmd41 = 41;
    reg[0:31] cmd41Arg = 1073741824;
    reg[0:7] cmd41Crc = 1;
    reg[0:7] cmd41Resp;

    reg[0:5] cmd17 = 17;
    reg[0:31] cmd17Arg = 2048;
    reg[0:7] cmd17Crc = 1;
    reg[0:7] cmd17Resp;

    reg[0:8] dataToken = 0;

    
    assign misoPin = misoReg;
    assign mosiPin = mosiReg;
    assign ssPin = ssReg;

    task sendSDCommand;
    input [0:5] cmdNumber;
    input [0:31] arg;
    input [0:7] crc;
    output [0:7] resp;
    begin
        while(!misoReg);                        // MISO goes high to indicate it is ready
        for (i = 0; i < 48; i = i+1) begin      // 40 bit command
            if (i == 0) begin
                //First bit is always 0
                mosiReg = 0;
                while (!clk);
            end
            else if (i == 1) begin
                //Second bit is always 1
                mosiReg = 1;
                while(!clk);
            end
            if (i >= 2 && i <= 7) begin
                //Send command number. This should be in the command input to this module
                mosiReg = cmdNumber[i-2];
                while(!clk);
            end
            if (i >= 8 && i <= 39) begin
                //Send arguments. For initilization, all 0s
                mosiReg = arg[i-8];
                while(!clk);
            end
            if (i >= 40) begin
                mosi_reg = crc[i-40];
            end
            while(clk);
        end
        //Wait until SD card signals it's ready to output (it will bring miso low)
        //and record the response
        while(misoReg);
        for (i = 0; i < 8; i = i + 1) begin
            while(!clk);
            resp[i] = miso;
            while(clk);
        end
    end

    task getStandardResponse;
    output resp[0:7];
    begin
        for (j = 0; j < 8; j = j + 1) begin
            while(!clk);
            resp[j] = miso;
            while(clk);
        end
    end
    
    initial begin
        dataReady = 0;
        ssReg = 1;
        mosiReg = 1;
        for (i = 0; i < 75; i = i+1) begin       //Put SD card into native mode
            while(!clk);
            while(clk);
        end
        sendSDCommand(cmd0, cmd0Arg, cmd0Crc, cmd0Resp); //Send CMD0 and get response
        //And so concludes CMD0

        //Next is Initialization. CMD8 for checking voltage range and 
        //determining the type of SD card
        sendSDCommand(cmd8, cmd8Arg, cmd8Crc, cmd8Resp);
        //Next is to collect the extended response for CMD8
        //Luckily, we don't need to do anything with it, so just clock it out
        for (j = 0; j < 32; j = j + 1) begin
            while(!clk);
            while(clk);
        end

        //Next is CMD55 and CMD41 to initialize the card for reading
        sendSDCommand(cmd55, cmd55Arg, cmd55Crc, cmd55Resp);
        sendSDCommand(cmd41, cmd41Arg, cmd41Crc, cmd41Resp);


        //Now send read command. 
        //Switch to cmd18 to read multiple blocks
        sendSDCommand(cmd17, cmd17Arg, cmd17Crc, cmd17Resp);
        //Now to actually read the data
        while(dataToken != 8'b11111110) begin
            getStandardResponse(dataToken);
        end
        for (j = 0; j < 512; j = j + 1) begin
            getStandardResponse(SDData[j]);
            for (i = 0; i < 16; i = i + 1) begin
                while(!clk);
                while(clk);
            end
        end

        dataReady = 1;

    end
    
    SPIMaster sdSPI(
        .clk(clk),
        .rst(rst),
        .miso(misoReg),
        .mosi(mosiReg),
        .sck(clk),
        .start(startSendingSignal),
        .data_in(spicmd),
        .data_out(response),
        .busy(busySignal),
        .new_data(rcvdResponseSignal)
    );


endmodule
