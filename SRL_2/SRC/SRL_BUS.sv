`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 12:46:35
// Design Name: 
// Module Name: SRL_BUS
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


module SRL_BUS #(
    parameter int unsigned BUS_WIDTH = 1,
    parameter int unsigned DELAY = 1
)(
    input logic clk,
    input logic rst,
    input logic [BUS_WIDTH - 1: 0] data_input,
    output logic [BUS_WIDTH - 1: 0] data_output
    );
    
    genvar i;
    generate
        for(i = 0; i < BUS_WIDTH; i = i + 1) begin
            
            SRL_BIT #(.DELAY_LENGTH(DELAY)) srl_block
            (
                .clk(clk),
                .rst(rst),
                .data_in(data_input[i]),
                .data_out(data_output[i])
            );
            
        end    
    endgenerate
    
    
    
endmodule
