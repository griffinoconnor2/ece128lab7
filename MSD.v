module MSD (
    input [15:0] bcd,
    input clk, rstn,
    output [6:0] cat,
    output [3:0] an
);

//Declare intermediate signals
wire [1:0] ancounter; //To be used as selector for both mux and decoder (numerical digit and place value respectively)
wire [3:0] digit; //To be used to forward selected numerica digit to BCDto7SD

//Instantiate misc. modules to generate anode and cathode signals 
AnodeCounter uut0(.clk(clk), .rstn(rstn), .sel(ancounter));

Mux4to1 uut1(.bcd(bcd), .S(ancounter), .digit(digit));

Decoder2to4 uut2(.S(ancounter), .an(an));

BCDto7SD uut3(.in(digit), .Seg(cat));

endmodule