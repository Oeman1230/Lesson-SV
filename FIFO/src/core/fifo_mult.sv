`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2024 13:23:45
// Design Name: 
// Module Name: fifo_mult
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


module fifo_mult#(
    parameter WIDTH = 8,
    parameter AMOUNT_OF_DATA = 16,
    parameter AMOUNT_OF_PACKET = 4
)(
        input logic clk,
        input logic rst,
        input logic [WIDTH - 1: 0] data_in1,
        input logic valid_in1,
        output logic ready_1,
        input logic [WIDTH - 1: 0] data_in2,
        input logic valid_in2,
        output logic ready_2,
        
        output logic[AMOUNT_OF_DATA - 1: 0] data_o,
        output logic valid_o
    );
    
    logic read_;
    
// START FIFO PART
    
    // input side 1
    logic ready_1_;
    logic full_1_;
    logic wren_1_;    

    always_comb begin
        ready_1_ = !full_1_;
        wren_1_ = ready_1_ & valid_in1;
    end
    
    // output side 1
    
    logic [WIDTH - 1: 0] do_1_;
    logic rden_1_;
    logic empty_1_;
    logic almost_full_1_;
    
    always_comb begin
        rden_1_ = (!empty_1_) & read_;
    end
    
    fifo_generator_0 FIFO_1 (
        .clk(clk),                  // input wire clk
        .srst(rst),                // input wire srst
        .din(data_in1),                  // input wire [7 : 0] din
        .wr_en(wren_1_),              // input wire wr_en
        .rd_en(rden_1_),              // input wire rd_en
        .dout(do_1_),                // output wire [7 : 0] dout
        .full(full_1_),                // output wire full
        .almost_full(almost_full_1_),  // output wire almost_full
        .empty(empty_1_),              // output wire empty
        .prog_full()      // output wire prog_full
    );


// SECOND FIFO


// input side 2
    logic ready_2_;
    logic full_2_;
    logic wren_2_;    

    always_comb begin
        ready_2_ = !full_2_;
        wren_2_ = ready_2_ & valid_in2;
    end
    
    // output side 2
    
    logic [WIDTH - 1: 0] do_2_;
    logic rden_2_;
    logic empty_2_;
    logic almost_full_2_;
    
    always_comb begin
        rden_2_ = (!empty_2_) & read_;
    end
    
    fifo_generator_0 FIFO_2 (
        .clk(clk),                  // input wire clk
        .srst(rst),                // input wire srst
        .din(data_in2),                  // input wire [7 : 0] din
        .wr_en(wren_2_),              // input wire wr_en
        .rd_en(rden_2_),              // input wire rd_en
        .dout(do_2_),                // output wire [7 : 0] dout
        .full(full_2_),                // output wire full
        .almost_full(almost_full_2_),  // output wire almost_full
        .empty(empty_2_),              // output wire empty
        .prog_full()      // output wire prog_full
    );

// END FIFO PART

    logic counter_in_;

    always_comb begin
     counter_in_ = almost_full_1_ & almost_full_2_;
    end

    Counter_FSM #(AMOUNT_OF_PACKET) counter (
        .clk(clk),
        .rst(rst),
        .en(counter_in_),
        .read(read_)
    );
    

// OUTPUT PART    
    
    logic [WIDTH - 1: 0] data_and_;
    
    always_comb begin
        data_and_ = do_1_ & do_2_;
    end
    
    logic data_o_rg_;
    logic valid_o_rg_;
    
    always @(posedge clk) begin
        if(read_) begin
            data_o <= data_and_;
        end
    end
    
    always @(posedge clk) begin
        valid_o <= read_;
    end
    
    
endmodule
