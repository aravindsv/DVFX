`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:45:07 03/07/2016 
// Design Name: 
// Module Name:    clock 
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
module clock(
    input sysClk,
    output reg slowClk,
    output reg initClk,
    output reg readClk
    );

	reg [11:0] divSlow;
    reg [7:0] divInit; //250
    reg [1:0] divRead; //4
	
	initial begin
		divSlow = 0;
	end
	
	always @ (posedge sysClk) begin
		if(divSlow == 2500) begin
			divSlow = 0;
			slowClk = 1;
		end else slowClk = 0;
		
		divSlow = divSlow + 1;
        
        if(divInit + 1 == 250) begin
			divInit = 0;
			initClk = 1;
		end else begin
            initClk = 0;
            divInit = divInit + 1;
        end
        
        if(divRead + 1 == 4) begin
			divRead = 0;
			readClk = 1;
		end else begin
            readClk = 0;
			divRead = divRead + 1;
        end
        
	end

endmodule
