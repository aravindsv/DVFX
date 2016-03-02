`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:07 02/22/2016 
// Design Name: 
// Module Name:    fx 
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
module fx(
    inAudio, fxSwitch, en, outAudio
    );
    
    input [15:0] inAudio;
    input [15:0] delAudio;
    input op; //1 = phaser, 0 = otherwise
    input en;
    output reg outAudio;
    //this is really not what we need
    
    reg [16:0] sumAudio;
    
    initial begin
        outAudio = 0;
        sumAudio = 0;
    end
    
    always begin
        if(op) sumAudio = inAudio - delAudio;
        else sumAudio = inAudio + delAudio;
        
        if(sumAudio > 17'b01111111111111111) sumAudio = 17'b01111111111111111;
        if((sumAudio > inAudio) && op) sumAudio = 0;
        
        outAudio = sumAudio;
    end
    

endmodule
