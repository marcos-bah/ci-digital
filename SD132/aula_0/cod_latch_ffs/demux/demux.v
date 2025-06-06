module demux (a, b, c, d, ent, sel);
  input ent;
  output reg a, b, c, d;
  input [1:0] sel;
  
  always @ (ent,sel)
    case (sel)
      0:begin
		      a <= ent;
			  b <= 1'b0;
			  c <= 1'b0;
			  d <= 1'b0;
		end
      1:begin
		      b <= ent;
			  a <= 1'b0;
			  c <= 1'b0;
			  d <= 1'b0;
		end 
      2:begin
		      c <= ent;
			  a <= 1'b0;
			  b <= 1'b0;
			  d <= 1'b0;
		end
      3:begin
		      d <= ent;
			  a <= 1'b0;
			  c <= 1'b0;
			  b <= 1'b0;
		end
   endcase
endmodule
