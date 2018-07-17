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


module ROUTING_XY(input [5:0] Destino, input [5:0] Actual, output Norte, output Este, output Oeste, output Sur, output Local);    
    
    // Variables Globales
    wire [2:0] columna_destino, columna_actual, fila_destino, fila_actual;
    
    // Como es combinacional se tiene que hacer con assign
    /*
    always @(*)
    begin    
        {Norte, Este, Oeste, Sur, Local} = 0;
        
        columna_destino = Destino [2:0];
        fila_destino = Destino [5:3];
        
        columna_actual = Actual [2:0];
        fila_actual = Actual [5:3];
        
        if (columna_destino < columna_actual)
            Oeste = 1;
        else if (columna_destino > columna_actual)
            Este = 1;
        else if (fila_destino < fila_actual)
            Norte = 1;
        else if (fila_destino > fila_actual)
            Sur = 1;
        else
            Local = 1;
            
    end
    */ 

    // Destino
    assign columna_destino = Destino [2:0];
    assign fila_destino = Destino [5:3];
    
    // Actual    
    assign columna_actual = Actual [2:0];
    assign fila_actual = Actual [5:3];

    assign Este = columna_destino > columna_actual;
	assign Oeste = columna_destino < columna_actual;
	assign Norte = ~Este & ~Oeste & (fila_destino < fila_actual);
	assign Sur    = ~Este & ~Oeste & (fila_destino > fila_actual);
	assign Local = ~Este & ~Oeste & ~Norte & ~Sur;
        

endmodule
