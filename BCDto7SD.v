module BCDto7SD (
    input [3:0] in,
    output reg [6:0] Seg
);

always @(*) begin
    case(in)
        //Input cases 0-9, assign corresponding 7SD output (represented a-g)
        4'b0000: Seg = 7'b0000001; //0
        4'b0001: Seg = 7'b1001111; //1
        4'b0010: Seg = 7'b0010010; //2
        4'b0011: Seg = 7'b0000110; //3
        4'b0100: Seg = 7'b1001100; //4
        4'b0101: Seg = 7'b0100100; //5
        4'b0110: Seg = 7'b0100000; //6
        4'b0111: Seg = 7'b0001111; //7
        4'b1000: Seg = 7'b0000000; //8
        4'b1001: Seg = 7'b0000100; //9
        default: Seg = 7'b1111111; //off

    endcase
end

endmodule