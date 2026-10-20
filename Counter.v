module Counter(
    input clk, rstn, clk1Hz,
    output reg [11:0] count,
    output reg en
);

reg clk1HzPS; //to store previous state of clk1Hz

always @(posedge clk or negedge rstn)
    begin
        if (!rstn) begin
            clk1HzPS <= 1'b0;
            count <= 12'b0; //Reset to 0
            en <= 1'b0;
        end
        else begin
            clk1HzPS <= clk1Hz;

            //Need a one cycle pulse for en 
            if (clk1Hz & ~clk1HzPS) begin //if rising edge
                count <= count + 1'b1; //Add one each cycle
                en <= 1'b1;
            end else begin
                en <= 1'b0;
            end
        end
    end

endmodule