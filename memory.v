`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:33 02/22/2016 
// Design Name: 
// Module Name:    memory 
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
module memory(
    input [15:0] inData,
    input clkMain,
    input clkSample,
    input [11:0] delay,
    output reg [15:0] out1,
    output reg [15:0] out2
    );

    //reg [15:0] ram[0:132299]; //dear Jesus what the fuck are we doing
    reg [15:0] ram[0:4];
    integer i = 0;
    
    always @ (posedge clkMain)
    begin
        out1 = ram[i];
        out2 = ram[(i+44*delay) % 132300];
        //out2 = ram[(i+delay) % 5];
    end
    
    always @ (posedge clkSample)
    begin
        ram[i] = inData;
        if(i+1 == 132300) i = 0;
        //if(i+1 == 5) i = 0;
        else i = i+1;
    end

endmodule
