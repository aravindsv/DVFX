`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:15:08 02/29/2016
// Design Name:   memory
// Module Name:   C:/Users/152/Desktop/DanielAravind/Lab4/ramTest.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ramTest;

	// Inputs
	reg [15:0] inData;
	reg clkMain;
	reg clkSample;
	reg [11:0] delay;

	// Outputs
	wire [15:0] out1;
	wire [15:0] out2;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.inData(inData), 
		.clkMain(clkMain), 
		.clkSample(clkSample), 
		.delay(delay), 
		.out1(out1), 
		.out2(out2)
	);

	initial begin
		// Initialize Inputs
		inData = 0;
		clkMain = 0;
		clkSample = 0;
		delay = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
     
    always @ (clkMain) begin
        if(delay + 1 == 5) delay = 0;
        else delay = delay + 1;
    end
    
    always @ (clkSample) begin
        if(inData + 1 > 65535) inData = 0;
        else inData = inData + 1;
    end
     
    always #5 clkMain = ~clkMain;
    always #50 clkSample = ~clkSample;
endmodule

