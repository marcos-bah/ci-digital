module DataMemory(
		   input wire 	      clk, WE,
		   input wire [31:0]  A, WD,
		   output wire [31:0] RD
		   );

   reg [31:0] 			      RAM[65535:0];

   assign RD = RAM[A[31:2]]; // word aligned


initial begin
   // RAM[32'h00_00_00_00]  = 32'hFACEFACE;
   // RAM[1]  = 32'h00000002; 
   // RAM[2]  = 32'h00000003; 
   
   // RAM[63] = 32'h000000063;  // Should be replaced by FACE

   RAM[2048] = 32'd10;
end



   always @(posedge clk)
     if (WE)
       RAM[A[31:2]] <= WD;

endmodule
