module PCTarget(
		 input wire [31:0]  PC,ImmExt,
		 output wire [31:0] PCTarget
		 );

   assign PCTarget= PC + ImmExt;

endmodule
