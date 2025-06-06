module count_order (
    input clk, rst,
    output reg [3:0] out
);
    always @(negedge clk or negedge rst) begin
        if (!rst) 
            out <= 4'h0;
        else if(!clk) begin
            if (out === 4'hF)
                out <= 4'h0;
            else
                out <= out + 4'h1;
        end
    end
endmodule