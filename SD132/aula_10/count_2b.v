module count_2b (
    input clk,
    input rst,
    output reg [1:0] out
);
always @(posedge clk or posedge rst) begin
    if (rst)
        out <= 2'b00;
    else if (out == 2'b10)
        out <= 2'b01;
    else
        out <= out + 2'b01;
end
endmodule
