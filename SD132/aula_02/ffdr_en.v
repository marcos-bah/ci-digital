 module ffdr_en (d, clk, rst, en, q);  
 input[3:0] d;
 input clk, rst, en;
 output reg [3:0] q;

 always @(posedge clk or posedge rst)
  begin
     if (rst == 1) q <= 0;	
	else if(en) q <= d;
  end
 endmodule
