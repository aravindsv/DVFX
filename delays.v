`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:13 02/29/2016 
// Design Name: 
// Module Name:    delays 
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
module delays(
    clk, settings, del1, del2, del3, del4
    );

    input clk;
    input [7:0] settings;
    output reg [11:0] del1;
    output reg [11:0] del2;
    output reg [11:0] del3;
    output reg [11:0] del4;

    initial begin
        del1 = 0;
        del2 = 0;
        del3 = 0;
        del4 = 0;
    end

    always @ (posedge clk) begin //delay is factored in .001 seconds, every 1 delay is a .001s delay
        case(settings[1:0]) //echo
            2'b00: del1 = 500; //.5s delay
            2'b01: del1 = 1000; //1s delay
            2'b10: del1 = 1500; //1.5s delay
            default: del1 = 0;
        endcase
        
        case(settings[3:2]) //chorus
            2'b00: del2 = 0;//slow sine
            2'b01: del2 = 0;//med sine
            2'b10: del2 = 0;//fast sine
            default: del2 = 0;
        endcase
        
        case(settings[5:4]) //phaser
            2'b00: del3 = 50; //fixed phase
            2'b01: del3 = 0;//sine phase
            2'b10: del3 = 0;//sawtooth phase
            default: del3 = 0;
        endcase
        
        case(settings[7:6]) //reverb
            2'b00: del4 = 0;
            2'b01: del4 = 0;
            2'b10: del4 = 0;
            default: del4 = 0;
        endcase
    end

endmodule
