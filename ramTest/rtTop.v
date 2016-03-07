`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:38:25 03/07/2016 
// Design Name: 
// Module Name:    rtTop 
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
module rtTop(
    input clk,
	 input sw,
    input RsRx,
    output RsTx,
    output reg [26:1] address,
    input [15:0] data,
    output oe,
    output we,
    output ramClk,
    output adv,
    output wt,
    output ce,
    output ub,
    output lb,
    output cre
    );

	wire slowClk;
	
	wire txReady;
	wire txBusy;
	
	wire [7:0] rxData;
	wire rxValid;
    
    reg [15:0] buffer;

	clock clockMod(
		.sysClk(clk),
		.slowClk(slowClk)
	);
	
	uart_top uart(
		// Outputs
		.o_tx(RsTx), 
		.o_tx_busy(txBusy), 
		.o_rx_data(rxData), 
		.o_rx_valid(rxValid),
		// Inputs
		.i_rx(RsRx), 
		//.i_tx_data(data), 
		.i_tx_data(buffer), 
		.i_tx_stb(txReady), //valid data: data to transmit and tx not busy
		.clk(clk), 
		.rst(0)
	);
	
	//all of these are 0 if reading or writing
	assign ramClk = 0;
	assign adv = 0;
	assign ce = 0;
	assign oe = 0;
	assign cre = 0;
	assign ub = 0;
	assign lb = 0;
	assign wt = 0;
	
	//This one actually depends on r/w
	assign we = 1; //1 for read, 0 for write
	
	assign txReady = ~txBusy & tick & sw;
	
	reg tick;
	
	initial begin
		address = 0;
		tick = 1;
        buffer = 0;
	end

	always @ (posedge clk) begin
		if(sw) begin
			if(slowClk) begin
				if(address != 536000) begin
                    buffer <= data;
					address <= address + 1;
					tick <= 1;
				end
			end
			if(txBusy) tick <= 0;
		end
	end

	
endmodule
