module Decoder2to4(
    input [1:0] S, //from an counter
    output reg [3:0] an
);

//Selection logic for anode/digit displayed (S = 0, pick ones, S = 1, pick tens, S = 2, pick hundreds, S = 3, pick thousands)
always @(*) begin
    case(S)
        2'b00: an = 4'b1110;
        2'b01: an = 4'b1101;
        2'b10: an = 4'b1011;
        2'b11: an = 4'b0111;
        default: an = 4'b1111;
    endcase

end

endmodule