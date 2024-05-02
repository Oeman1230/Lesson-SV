`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 10:00:12
// Design Name: 
// Module Name: SRL_BIT_tb
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


module SRL_BIT_tb;

logic clk = 0;
logic in = 1;
logic rst = 0;
logic out = 0;



localparam int unsigned DELAY = 1;

SRL_BIT #(.DELAY_LENGTH(DELAY)) test_srl (
    .data_in(in),
    .data_out(out),
    .clk(clk),
    .rst(rst)
);

int unsigned counter = 0;

always begin
    #400ns;
    rst = ~rst;
end

always begin
    
    #25ns;
    in = 1;
    #25ns;
    in = 0;
    #100ns;
    
end

always begin
    
    
    #25ns;
    clk = ~clk;
    
    //counter++;
    
    /* if(counter == 2) begin
        in = ~in;
        counter = 0;
    end */
    
    

end





endmodule
