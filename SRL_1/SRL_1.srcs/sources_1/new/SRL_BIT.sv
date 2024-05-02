`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 09:59:42
// Design Name: 
// Module Name: SRL_BIT
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


module SRL_BIT #(
    parameter int unsigned DELAY_LENGTH = 1) 
    (
    
    input logic data_in,
    input logic rst,
    input logic clk,
    output logic data_out
    
    );
    
    logic [DELAY_LENGTH : 0] holder = 0;
    
    
    always_ff @(posedge clk) begin
        
        
        if(rst) begin
            holder <= 0;
            data_out <= 0;
        end
        else begin 
            holder <= holder << 1;
            holder[0] <= data_in;
            data_out <= holder[DELAY_LENGTH - 1];
        end
        
        
        
    end
    
    
endmodule
