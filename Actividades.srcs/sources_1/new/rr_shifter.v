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

module rr_shifter (in, out, bits_to_shift, next_token);

	// Selección de la rotación: 0 = izquierda, 1 = derecha
	parameter shift = 1'b0;

	// Entradas y Salidas
	input [3:0] in;
	input [1:0] bits_to_shift;
	output [3:0] out;
	output[2:0] next_token; 
	wire [7:0] aux;
	
	assign aux = (~shift) ? 
				 {in [3:0], in [3:0]} << bits_to_shift :
			 	 {in [3:0], in [3:0]} << -bits_to_shift;


    
	assign out = aux[3:0];
	
	//next_token -> siguiente elemento mas prioritario
	assign next_token = (~shift) ? 3'b000 : (out [0]) ? 3'b001 :
                            (out [1]) ? 3'b010 :
                            (out [2]) ? 3'b011 :
                            (out [3]) ? 3'b000 :
                            3'b100;	

endmodule