`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2024 10:56:46
// Design Name: 
// Module Name: Counter_FSM_tb
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


module Counter_FSM_tb;

localparam int CLK_PERIOD = 10;
localparam int COUNTER_LEN = 8;

logic clk = 0;
logic rst = 0;
logic en = 0;

logic [(2**$clog2(COUNTER_LEN)) - 1: 0] counter_out;

logic read;

Counter_FSM #(.COUNTER_LEN(COUNTER_LEN)) uut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .counter_out(counter_out),
    .read(read)
);

initial begin
    forever begin
        #(CLK_PERIOD);
        clk = ~clk;
    end
    
end

initial begin
    en = 1;
    repeat(2) @(posedge clk);
    en = 0;
    
    repeat(8) @(posedge clk);
    en = 1;
    repeat(2) @(posedge clk);
    en = 0;
end


initial begin
    rst = 0;
    repeat(15) @(posedge clk);
    rst = 1;
    
end


endmodule
