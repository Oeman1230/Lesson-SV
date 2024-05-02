`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 12:49:33
// Design Name: 
// Module Name: SRL_BUS_tb
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


module SRL_BUS_tb;

localparam int unsigned WIDTH = 4;
localparam int unsigned DELAY = 2;

logic clk = 0;
logic [WIDTH - 1 : 0] in  = 0;
logic rst = 0;
logic [WIDTH - 1 : 0] out = 0;

always begin
    #25ns;
    clk = ~clk;
end

always begin
    if(clk) begin
        in = in + 1;
    end
end







endmodule
