`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2018 17:33:35
// Design Name: 
// Module Name: fpa
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


module fpa(in, out);

	// Entradas y Salidas
	input [0:3] in;
	output [0:3] out;
//	output [2:0] token_fpa;

	assign out [0] = in [0];
	assign out [1] = ~in [0] & in [1];
	assign out [2] = ~in [0] & ~in [1] & in [2];
	assign out [3] = ~in [0] & ~in [1] & ~in [2] & in [3];


endmodule
