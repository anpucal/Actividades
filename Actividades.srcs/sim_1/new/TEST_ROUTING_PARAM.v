`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2018 11:54:59
// Design Name: 
// Module Name: TEST_ROUTING_PARAM
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


module TEST_ROUTING_PARAM();

	localparam FILAS = 16;
	localparam COLUMNAS = 16;
	localparam x_size = $clog2(FILAS) + $clog2(COLUMNAS);

	reg [x_size - 1:0] Destino, Actual;
	wire w_norte, w_este, w_oeste, w_sur, w_local;

	ROUTING_XY_PARAM #(.FILAS(FILAS), .COLUMNAS(COLUMNAS)) dut (
        .Destino(Destino),
        .Actual(Actual),
        .Norte(w_norte),
        .Este(w_este),
        .Oeste(w_oeste),
        .Sur(w_sur),
        .Local(w_local)
	);

    initial
    begin
        // Local
        Destino = 8'b01000100;
        Actual = 8'b01000100;
        
        #2
        
        // Norte
        Destino = 8'b00000100;
        Actual = 8'b01000100;
        
        #2
        
        // Este
        Destino = 8'b01000111;
        Actual = 8'b01000100;
        
        #2
        
        // Sur
        Destino = 8'b01110100;
        Actual = 8'b01000100;
        
        #2
        
        // Oeste
        Destino = 8'b01000000;
        Actual = 8'b01000100;
        
        #2
        
        $finish;        
    end

endmodule
