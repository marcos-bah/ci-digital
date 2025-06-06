module count_order_bidir (
	input clk, rst, dir,
	output reg [3:0] out
);
	always @(negedge clk or negedge rst) begin
		if (!rst)
			if (dir) 
				out <= 4'h0;
			else 
				out <= 4'hF;
		else begin
			if (dir) begin 
				if (out == 4'hF)
					out <= 4'h0;
				else
					out <= out + 4'h1;
			end else begin 
				if (out == 4'h0)
					out <= 4'hF;
				else
					out <= out - 4'h1;
			end
		end
	end
endmodule