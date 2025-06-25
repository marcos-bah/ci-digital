module counter (
	input clk, rst, 
    output reg [2:0] count
);

reg k;

always @(posedge clk, posedge rst) begin
	if (rst) begin
    	count <= 0;
    	k <= 0;
	end else if (count == 4) begin
    	count <= 0;
    	k <= 1;
	end else begin
    	count <= count + 1;
    	k <= 0;
	end
end

endmodule