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
    ssPin
    );
    
    input clk;
    input [0:5] command;
    input [31:0] argument;
    output reg [16:0] SDData[0:1322999];  //44100 samples/sec * 16 bits/sample * 30 seconds
    input sendCmd;
    input misoPin;
    input mosiPin;
    input ssPin;
    

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
    
    assign misoPin = misoReg;
    assign mosiPin = mosiReg;
    assign ssPin = ssReg;
    
    initial begin
        ssReg = 1;
        mosiReg = 1;
        for (i = 0; i < 75; i = i+1) begin       //Put SD card into native mode
            while(!clk);
            while(clk);
        end
        while(!misoReg);                        // MISO goes high to indicate it is ready
        for (i = 0; i < 40; i = i+1) begin      // 40 bit command
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
                mosiReg = command[i-2];
                while(!clk);
            end
            if (i >= 8 && i <= 39) begin
                //Send arguments. For initilization, all 0s
                mosiReg = 0;
                while(!clk);
            end
            while(clk);
        end
        //Wait until SD card signals it's ready to output (it will bring miso low)
        //and record the response
        while(miso);
        for (i = 0; i < 8; i = i + 1) begin
            while(!clk);
            response[i] = miso;
            while(clk);
        end
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
