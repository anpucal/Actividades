`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2018 20:05:06
// Design Name: 
// Module Name: rr_shifter_tb
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


module rr_shifter_tb();
	
	localparam shift = 1'b1;

	reg [0:3] in;
	reg [1:0] bits_to_shift;
	wire [0:3] out;

	rr_shifter #(.shift(shift)) dut (
		.in(in),
		.bits_to_shift(bits_to_shift),
		.out(out)
	);

	initial
	begin
		in = 4'b0110;
		bits_to_shift = 2'b00;

		#2

		in = 4'b0110;
		bits_to_shift = 2'b01;

		#2

		in = 4'b0110;
		bits_to_shift = 2'b10;

		#2

		in = 4'b0110;
		bits_to_shift = 2'b11;

		#2

		$finish;
	end

endmodule
