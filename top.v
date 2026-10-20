module top(
    input wire clk, rstn,
    output wire [3:0] an,
    output wire [6:0] cat,
    output wire rdy
);

    wire clk1Hz, clk1KHz, en;
    wire [11:0] count;
    wire [15:0] BCD;

    // Clock divider
    ClockDiv mod0 (
        .clkin(clk),
        .rstn(rstn),
        .clkout1KHz(clk1KHz),
        .clkout1Hz(clk1Hz)
    );

    // Counter 
    Counter mod1 (
        .clk(clk),
        .rstn(rstn),
        .clk1Hz(clk1Hz),
        .count(count),
        .en(en)
    );

    // Binary to BCD
    BintoBCD mod2 (
        .clk(clk),
        .rstn(rstn),
        .en(en),
        .count(count),
        .BCD(BCD),
        .rdy(rdy)
    );

    // Multi-segment Display Driver
    MSD mod3 (
        .bcd(BCD),
        .clk(clk1KHz),
        .rstn(rstn),
        .cat(cat),
        .an(an)
    );

endmodule