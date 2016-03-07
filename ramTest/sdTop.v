`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:00 03/07/2016 
// Design Name: 
// Module Name:    sdTop 
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
module sdTop(
    input clk,
    input miso,
    input sw,
    input led,
    output mosi,
    output ss,
    output sdClk,
    input RsRx,
    output RsTx
    );

    wire slowClk;
    wire initClk;
    wire readClk;
    
    wire [7:0] data[511:0];
    wire ready;

    clock ck(
        .sysClk(clk),
        .slowClk(slowClk),
        .initClk(initClk),
        .readClk(readClk)
    );

    SDCardReader sdRead(
        .readClk(readClk),
        .initClk(initClk),
        .SDData(data),
        .misoPin(miso),
        .mosiPin(mosi),
        .ssPin(ss),
        .clk(sdClk),
        .dataReady(ready)
        );
        
    wire txBusy;
    wire [7:0] rxData;
    wire rxValid;
    
    wire txReady;
    
    uart_top uart(
		// Outputs
		.o_tx(RsTx), 
		.o_tx_busy(txBusy), 
		.o_rx_data(rxData), 
		.o_rx_valid(rxValid),
		// Inputs
		.i_rx(RsRx), 
		//.i_tx_data(data), 
		.i_tx_data(), 
		.i_tx_stb(), //valid data: data to transmit and tx not busy
		.clk(clk), 
		.rst(0)
	);

endmodule
