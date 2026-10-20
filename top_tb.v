`timescale 1ns/1ps
module top_tb;
    reg clk, rstn;
    wire rdy;
    wire [3:0] an;
    wire [6:0] cat;

top uut(
    .clk(clk),
    .rstn(rstn),
    .an(an),
    .cat(cat),
    .rdy(rdy)
);

always #5 clk = ~clk;

initial begin 
    rstn = 0; clk = 0; 
    #20 rstn = 1; //Release reset

    repeat (10) begin //Count up until 10
        #1342177280; 
    end

    #20 rstn = 0; //Test reset
    #50 
    $finish; 
end

endmodule