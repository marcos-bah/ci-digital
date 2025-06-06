module reg_8b (
    input clk,
    input rst,
    input load,
    input [7:0] d,
    output reg [7:0] q
);
always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 8'b0;
    else if (load)
        q <= d;
end
endmodule
