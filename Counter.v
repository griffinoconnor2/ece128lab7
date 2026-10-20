module Counter(
    input clk, rstn,
    output reg [11:0] count
);

always @(posedge clk or negedge rstn)
    begin
        if (!rstn)
            count <= 12'b0; //Reset to 0
        else
            count <= count + 1'b1; //Add one each cycle
    end

endmodule