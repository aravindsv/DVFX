`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:02 02/22/2016 
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
    sysClk, clkSample, clkDisp
    );

    input sysClk;
    output clkSample;
    output clkDisp;

    reg [11:0] divSamp; //2267
    reg [19:0] divDisp; //100000
    
    initial begin
        divSamp = 0;
        divDisp = 0;
    end
    
    always @ (posedge sysclk) begin
        if(divSamp == 2267) begin
            divSamp = 0;
            clkSample = 1;
        end else clkSample = 0;
        
        if(divDisp == 100000) begin
            divDisp = 0;
            clkDisp = 1;
        end else clkDisp = 0;
        
        divDisp = divDisp + 1;
        divSamp = divSamp + 1;
    end
    
endmodule
