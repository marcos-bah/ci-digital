module mux4(D, sel, y);
input [1:0] D; 
input sel;
output reg y;

always@(*) begin
	if(sel == 1'b0)
		y = D[0];
	else
		y = D[1];
end

endmodule