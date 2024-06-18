`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2024 14:18:19
// Design Name: 
// Module Name: stream_acc
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

/*
    stream_acc #(.WIDTH(WIDTH), .AMOUNT_OF_DATA(AMOUNT_OF_DATA), .AMOUNT_OF_PACKET(AMOUNT_OF_PACKET)) uut(
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .valid_in(valid_in),
        .data_o(data_o),
        .valid_o(valid_o)
    ); 
*/

module stream_acc #(WIDTH = 8, AMOUNT_OF_DATA = 16, AMOUNT_OF_PACKET = 8)(
        input logic clk,
        input logic rst,
        input logic [WIDTH - 1 : 0] data_in,
        input logic valid_in,
        output logic [WIDTH - 1 : 0] data_o,
        output logic valid_o
    );
    
    logic[WIDTH - 1 : 0] data_count;
    logic[WIDTH - 1 : 0] data_count_2d;
    logic[WIDTH - 1 : 0] data_count_3d;
    
    logic valid_in_3d;
    
    logic [AMOUNT_OF_DATA + WIDTH - 1 : 0] data_sum_in1;
    logic [AMOUNT_OF_DATA + WIDTH - 1 : 0] data_sum_in2;
    logic [AMOUNT_OF_DATA + WIDTH - 1 : 0] data_sum_o;
    
    logic [WIDTH - 1 : 0] packet_count;
    logic last_packet;
    
    
  Counter_FSM #(AMOUNT_OF_PACKET ) counter_2_ (
        .clk(clk),
        .rst(rst),
        .en(counter_in_),
        .read(read_)
    );  
    
    Counter_FSM #(AMOUNT_OF_DATA ) counter_1_ (
        .clk(clk),
        .rst(rst),
        .en(counter_in_),
        .read(read_)
    );  
    
    srl_bus #(.WIDTH(WIDTH), .CLK_CYCL(2)) Delay2_1_ (
        .clk(clk),
        .rst(rst),
        .in(),
        .out()
    );
    
    srl_bus #(.WIDTH(WIDTH), .CLK_CYCL(2)) Delay2_2_ (
        .clk(clk),
        .rst(rst),
        .in(),
        .out()
    );
   
   srl_bus #(.WIDTH(WIDTH), .CLK_CYCL(3)) Delay3_1_ (
        .clk(clk),
        .rst(rst),
        .in(),
        .out()
    );
   
endmodule
