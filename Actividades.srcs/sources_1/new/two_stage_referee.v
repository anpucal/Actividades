`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2018 17:39:10
// Design Name: 
// Module Name: two_stage_referee
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


module two_stage_referee (clk, rst, reqs, grants);

	// Entrades i eixides
	input [0:3] reqs;
	input clk, rst;
	output [0:3] grants;

	reg [2:0] token;
	wire [2:0] w_token;
	wire [1:0] bits_to_shift;

	// Cables
	wire [0:3] lsh_to_fpa, fpa_to_rsh;
	

	localparam shift_left = 1'b0;
	localparam shift_right = 1'b1;

    //left_shifter
	rr_shifter #(.shift(shift_left)) left_shifter (
		.in(reqs),
		.bits_to_shift(bits_to_shift),
		.out(lsh_to_fpa)
	);

    //right_shifter
	rr_shifter #(.shift(shift_right)) right_shifter (
		.in(fpa_to_rsh),
		.bits_to_shift(bits_to_shift),
		.out(grants),
		.next_token(w_token)
	);

    //fpa
	fpa fpa_u (
		.in(lsh_to_fpa),
		.out(fpa_to_rsh)
	);

	always @(posedge clk or posedge rst)
	begin
		if (rst)
		begin
			token = 3'b000;
		end
		else
			if (w_token != 4)
				token = w_token;	
	end

	assign bits_to_shift = token [1:0];

endmodule
