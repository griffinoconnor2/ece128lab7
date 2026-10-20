module AnodeCounter(
    input clk, rstn,
    output reg [1:0] sel
);

//Anode Counting logic (cycle 0-3 quickly to display each digit simultaneously (to human eye))
always @(posedge clk or negedge rstn)
    begin
        if (!rstn)
            sel <= 2'b00;
        else
            sel <= sel + 2'b01;
    end

endmodule