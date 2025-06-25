module counter #(parameter N = 4)(
	input clk, rst, 
    output reg [($clog2(N+1))-1:0] count
);

reg k;

always @(posedge clk, posedge rst) begin
	if (rst) begin
    	count <= 0;
    	k <= 0;
	end else if (count == N) begin
    	count <= 0;
    	k <= 1;
	end else begin
    	count <= count + 1;
    	k <= 0;
	end
end

endmodule