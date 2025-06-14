module deslocamento(input clk, input rst, input load, input enable, input [2:0] d, output reg [2:0] q);
    always @(posedge clk or posedge rst)
        if (rst) q <= 0;
        else if (load) q <= d;
        else if (enable) q <= {q[1:0], 1'b0}; 
endmodule
