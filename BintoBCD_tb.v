`timescale 1ns/1ps

module BintoBCD_tb;
    reg clk, rstn, en;
    reg [11:0] count;
    wire [15:0] BCD;
    wire rdy;

BintoBCD uut(
    .clk(clk),
    .rstn(rstn),
    .en(en),
    .count(count),
    .BCD(BCD),
    .rdy(rdy)
);

always #5 clk = ~clk;

initial begin
    rstn = 0; clk = 0; en = 0; count = 12'b0;

    #20 rstn = 1;
    #10;

    //Test case 3456 conversion
    count = 12'd3456;
    en = 1;
    #10 en = 0; //en on for one clock cycle
    #1000; //Wait for conversion to be done


    //Test case 1234 conversion
    #20 count = 1234; en = 1;
    #10 en = 0;

    #1000 $finish;



end

endmodule