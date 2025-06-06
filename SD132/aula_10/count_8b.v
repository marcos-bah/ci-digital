module count_8b (
    input clk,
    input rst,
    output reg [7:0] out
);
always @(posedge clk or posedge rst) begin
    if (rst)
        out <= 8'h0;
    else if (out == 8'hFF)
        out <= 8'h0;
    else
        out <= out + 8'h1;
end
endmodule
