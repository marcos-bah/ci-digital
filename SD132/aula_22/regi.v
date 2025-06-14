module regi(input clk, input rst, input enable, input [2:0] d, output reg [2:0] q);
    always @(posedge clk or posedge rst)
        if (rst) q <= 0;
        else if (enable) q <= d;
endmodule