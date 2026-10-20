module Mux4to1 (
    input [15:0] bcd, //From BintoBCD
    input [1:0] S, //From anode counter
    output reg [3:0] digit,
);

//Selection logic (S = 0, pick ones, S = 1, pick tens, S = 2, pick hundreds, S = 3, pick thousands)
always @(*) begin
    case (S)
        2'b00: digit = bcd[3:0];
        2'b01: digit = bcd[7:4];
        2'b10: digit = bcd[11:8];
        2'b11: digit = bcd[15:12];
    endcase
end

endmodule