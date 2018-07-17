`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2018 10:08:05
// Design Name: 
// Module Name: TEST_ROUTING
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


module TEST_ROUTING();
    reg [5:0] Destino, Actual;
    wire w_norte, w_este, w_oeste, w_sur, w_local;
    
    ROUTING_XY dut (
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
        Destino = 6'b100100;
        Actual = 6'b100100;
        
        #2
        
        // Norte
        Destino = 6'b000100;
        Actual = 6'b100100;
        
        #2
        
        // Este
        Destino = 6'b100111;
        Actual = 6'b100100;
        
        #2
        
        // Sur
        Destino = 6'b111100;
        Actual = 6'b100100;
        
        #2
        
        // Oeste
        Destino = 6'b100000;
        Actual = 6'b100100;
        
        #2
        
        $finish;        
    end
endmodule
