module demux_latch (a, b, c, d, ent, sel);
  input ent;
  output reg a, b, c, d;
  input [1:0] sel;
  
  always @ (ent,sel)
    case (sel)
      0:begin
		      a <= ent;
		end
      1:begin
		      b <= ent;
		end 
      2:begin
		      c <= ent;
		end
      3:begin
		      d <= ent;
		end
   endcase
endmodule
