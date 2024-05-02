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

localparam int unsigned WIDTH = 2;
localparam int unsigned DELAY = 2;

logic clk = 0;
logic [WIDTH - 1 : 0] in  = 0;
logic rst = 0;
logic [WIDTH - 1 : 0] out = 0;

logic swap = 0;

always begin
    #25ns;
    clk = ~clk;
    
    if(swap) begin
        in = in + 1;
    end
    
    swap = ~swap;
    
end

always begin
    #500ns;
    rst = 1;
end

/* always @(posedge clk) begin 
    in <= in + 1;
    
end */

    SRL_BUS #(.DELAY(DELAY),
              .BUS_WIDTH(WIDTH)) test_srl_bus(
              .clk(clk),
              .rst(rst),
              .data_input(in),
              .data_output(out)
              );





endmodule
