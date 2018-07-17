`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2018 13:17:32
// Design Name: 
// Module Name: two_stage_referee_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module two_stage_referee_tb();
	
	reg [0:3] reqs;
	reg clk, rst;
	wire [0:3] grants;

	two_stage_referee dut(
		.reqs(reqs),
		.clk(clk),
		.rst(rst),
		.grants(grants)
	);

	initial
	begin
	    clk = 1'b0;
	    rst = 1'b1;

	    #2

	    rst = 1'b0;
	    forever #2 clk = ~clk;
	end

	initial
	begin
			
		#4
		
		reqs = 4'b1001;

		#4

		reqs = 4'b1011;

		#4

		reqs = 4'b0101;
        
        			
        #4
        
        reqs = 4'b0110;

		#4	

		$finish;

	end

endmodule
