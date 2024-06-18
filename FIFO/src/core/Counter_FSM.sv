`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2024 10:47:51
// Design Name: 
// Module Name: Counter_FSM
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


module Counter_FSM #(COUNTER_LEN = 4)(
        input logic clk,
        input logic rst,
        input logic en,
        output logic[(2**$clog2(COUNTER_LEN)) - 1: 0] counter_out,
        output logic read
    );
    
    logic[(2**$clog2(COUNTER_LEN)) - 1: 0] counter_ = '0;
    int unsigned counter_i_ = 0;
    logic isActive_ = 0;   
    //always_ff@(posedge clk) begin
        
    //end
    
    always_ff@(posedge clk) begin
        if(rst) begin
            counter_ <= '0;
            counter_out <= counter_;
            isActive_ <= 0;
            
            read <= 0;
        end
        else if(en) begin
            isActive_ <= 1;
        end
        if (isActive_ ) begin
            read <= 1;
            if (counter_i_ < COUNTER_LEN ) begin
                counter_ <= counter_ + 1;
                counter_i_ <= counter_i_ + 1;
                counter_out <= counter_;
            end
            else begin
                counter_i_ <= '0;
                counter_ <= '0;
                counter_out <= '0;
                isActive_ <= 0;
                
                read <=0;    
            end
        end    
        
    end

    
endmodule
