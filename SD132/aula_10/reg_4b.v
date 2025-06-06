module reg_4b (
    input clk,
    input rst,
    input load,
    input [3:0] d,
    output reg [3:0] q
);
always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 4'b0;
    else if (load)
        q <= d;
end
endmodule
