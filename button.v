`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:17 02/24/2016 
// Design Name: 
// Module Name:    button 
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
module button(
    clk, btnL, btnR, btnU, btnD, btnS, options, sel
    );
    
    input clk; //best to run this on a fast clock.  system perhaps
    input btnL;
    input btnR;
    input btnU;
    input btnD;
    input btnS;
    
    output reg [7:0] options;
    output reg [1:0] sel;
    
    wire btnRdbd;
    wire btnLdbd;
    wire btnUdbd;
    wire btnDdbd;
    wire btnSdbd;
    
    debouncer dbdL(
        .btn(btnL),
        .clk(clk),
        .dbd(btnLdbd)
    );
    
    debouncer dbdR(
        .btn(btnR),
        .clk(clk),
        .dbd(btnRdbd)
    );
    
    debouncer dbdU(
        .btn(btnU),
        .clk(clk),
        .dbd(btnUdbd)
    );
    
    debouncer dbdD(
        .btn(btnD),
        .clk(clk),
        .dbd(btnDdbd)
    );
    
    debouncer dbdS(
        .btn(btnS),
        .clk(clk),
        .dbd(btnSdbd)
    );
    
    reg lPos;
    reg rPos;
    reg uPos;
    reg dPos;
    reg sPos;
    
    initial begin
        options = 0;
        sel = 0;
        
        lPos = 0;
        rPos = 0;
        uPos = 0;
        dPos = 0;
        sPos = 0;
    end
    
    
    always @ (posedge btnL) begin
       lPos = 1;
    end
    
    
endmodule
