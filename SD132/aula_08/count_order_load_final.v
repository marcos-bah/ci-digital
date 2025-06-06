module count_order_load_final (
	input clk, rst, dir, load,
	input [3:0] vf, 
	output reg [3:0] out
);

	reg [3:0] v_final;

	always @(negedge clk or negedge rst) begin
		if (!rst) begin
			if (dir)
				out <= 4'h0;
			else
				out <= vf;
		end else begin
			if (load) begin
				v_final <= vf;
			end else begin
				if (dir) begin
					if (out == v_final)
						out <= 4'h0;
					else
						out <= out + 1;
				end else begin
					if (out == 4'h0)
						out <= v_final;
					else
						out <= out - 1;
				end
			end
		end
	end
endmodule
