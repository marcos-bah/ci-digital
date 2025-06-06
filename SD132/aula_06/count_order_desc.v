module count_order_desc (
    input clk, rst,
    output reg [3:0] out
);
    always @(negedge clk or negedge rst) begin
        if (!rst) 
            out <= 4'hF;
        else if(!clk) begin
            if (out === 4'h0)
                out <= 4'hF;
            else
                out <= out - 4'h1;
        end
    end
endmodule