`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:44 02/24/2016 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
    btn, clk, dbd
    );

    input btn;
    input clk;
    output reg dbd;
    
    reg [1:0] sync;
    reg [15:0] count;

    initial begin
        dbd = 0;
        sync = 0;
        count = 0;
    end
    
    always @ (posedge clk) sync[0] = btn;
    always @ (posedge clk) sync[1] = sync[0];
    
    always @ (posedge clk) begin
        if(dbd == sync[1]) count <= 0;
        else begin
            count <= count + 1'b1;
            if(count == 16'b1111111111111111) dbd = ~dbd;
        end
    end
endmodule
