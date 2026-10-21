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

    repeat (100) begin //Count up until 100
        #2560; 
    end

    #2560 rstn = 0; //Test reset
    #50 rstn = 1;

    repeat (5) begin //Count 5 more to see reset 
        #2560; 
    end 
    $finish; 
end

endmodule