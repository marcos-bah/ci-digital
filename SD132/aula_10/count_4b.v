module count_4b (
    input clk,
    input rst,
    output reg [3:0] out
);
always @(posedge clk or posedge rst) begin
    if (rst)
        out <= 4'h0;
    else if (out == 4'hF)
        out <= 4'h0;
    else
        out <= out + 4'h1;
end
endmodule
