`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2018 17:29:21
// Design Name: 
// Module Name: ROUTING_XY
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


module ROUTING_XY_PARAM(Destino, Actual, Norte, Este, Oeste, Sur, Local);   

	// Parámetros Genéricos
	parameter FILAS = 8;
	parameter COLUMNAS = 8;

    // Parámetros
    localparam x_size = $clog2(FILAS) + $clog2(COLUMNAS);
    localparam filas_size = $clog2(FILAS);
    localparam columnas_size = $clog2(COLUMNAS); 

    // Cálculo bits filas y columnas
    localparam msb_fila = $clog2(FILAS) + $clog2(COLUMNAS) - 1;
    localparam lsb_fila = $clog2(COLUMNAS);
    localparam msb_columna = $clog2(COLUMNAS) - 1;
    localparam lsb_columna = 0;

    // Variables Globales
    wire [columnas_size - 1:0] columna_destino, columna_actual;
    wire [filas_size - 1:0] fila_destino, fila_actual;
    
    // Entradas y Salidas
    input [x_size - 1:0] Destino, Actual;
    output Norte, Este, Oeste, Sur, Local;
           
    // Destino
    assign columna_destino = Destino [msb_columna:lsb_columna];
    assign fila_destino = Destino [msb_fila:lsb_fila];
    
    // Actual    
    assign columna_actual = Actual [msb_columna:lsb_columna];
    assign fila_actual = Actual [msb_fila:lsb_fila];

    assign Este = columna_destino > columna_actual;
    assign Oeste = columna_destino < columna_actual;
    assign Norte = ~Este & ~Oeste & (fila_destino < fila_actual);
    assign Sur    = ~Este & ~Oeste & (fila_destino > fila_actual);
    assign Local = ~Este & ~Oeste & ~Norte & ~Sur;        

endmodule
