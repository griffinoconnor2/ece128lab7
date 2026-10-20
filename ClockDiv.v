module ClockDivider(
    input clkin, rstn, 
    output clkout1KHz, clkout1Hz //Self explanatory
    );

    //Intermediate wire to propogate ff0 output to clock of ff1
    wire [25:0] Q;

    //For the 1KHz output
    assign clkout1KHz = Q[16];

    //Clock divider for ~1Hz and ~1KHz
    TFF ff0(.clk(clkin), .rstn(rstn), .T(1'b1), .Q(Q[0]));
    TFF ff1(.clk(~Q[0]), .rstn(rstn), .T(1'b1), .Q(Q[1]));
    TFF ff2(.clk(~Q[1]), .rstn(rstn), .T(1'b1), .Q(Q[2]));
    TFF ff3(.clk(~Q[2]), .rstn(rstn), .T(1'b1), .Q(Q[3]));
    TFF ff4(.clk(~Q[3]), .rstn(rstn), .T(1'b1), .Q(Q[4]));
    TFF ff5(.clk(~Q[4]), .rstn(rstn), .T(1'b1), .Q(Q[5]));
    TFF ff6(.clk(~Q[5]), .rstn(rstn), .T(1'b1), .Q(Q[6]));
    TFF ff7(.clk(~Q[6]), .rstn(rstn), .T(1'b1), .Q(Q[7]));
    TFF ff8(.clk(~Q[7]), .rstn(rstn), .T(1'b1), .Q(Q[8]));
    TFF ff9(.clk(~Q[8]), .rstn(rstn), .T(1'b1), .Q(Q[9]));
    TFF ff10(.clk(~Q[9]), .rstn(rstn), .T(1'b1), .Q(Q[10]));
    TFF ff11(.clk(~Q[10]), .rstn(rstn), .T(1'b1), .Q(Q[11]));
    TFF ff12(.clk(~Q[11]), .rstn(rstn), .T(1'b1), .Q(Q[12]));
    TFF ff13(.clk(~Q[12]), .rstn(rstn), .T(1'b1), .Q(Q[13]));
    TFF ff14(.clk(~Q[13]), .rstn(rstn), .T(1'b1), .Q(Q[14]));
    TFF ff15(.clk(~Q[14]), .rstn(rstn), .T(1'b1), .Q(Q[15]));
    TFF ff16(.clk(~Q[15]), .rstn(rstn), .T(1'b1), .Q(Q[16]));
    TFF ff17(.clk(~Q[16]), .rstn(rstn), .T(1'b1), .Q(Q[17]));
    TFF ff18(.clk(~Q[17]), .rstn(rstn), .T(1'b1), .Q(Q[18]));
    TFF ff19(.clk(~Q[18]), .rstn(rstn), .T(1'b1), .Q(Q[19]));
    TFF ff20(.clk(~Q[19]), .rstn(rstn), .T(1'b1), .Q(Q[20]));
    TFF ff21(.clk(~Q[20]), .rstn(rstn), .T(1'b1), .Q(Q[21]));
    TFF ff22(.clk(~Q[21]), .rstn(rstn), .T(1'b1), .Q(Q[22]));
    TFF ff23(.clk(~Q[22]), .rstn(rstn), .T(1'b1), .Q(Q[23]));
    TFF ff24(.clk(~Q[23]), .rstn(rstn), .T(1'b1), .Q(Q[24]));
    TFF ff25(.clk(~Q[24]), .rstn(rstn), .T(1'b1), .Q(Q[25]));
    TFF ff26(.clk(~Q[25]), .rstn(rstn), .T(1'b1), .Q(clkout1Hz));

endmodule

module TFF(
    input clk, rstn, T,
    output reg Q
);

//TFF Logic 
always @ (posedge clk or negedge rstn) begin
    if (!rstn) //rstn --> active low reset signal (reset when rstn == 0)
        Q <= 1'b0;
    else if (T)
        Q <= ~Q;
    else
        Q <= Q;
end

endmodule