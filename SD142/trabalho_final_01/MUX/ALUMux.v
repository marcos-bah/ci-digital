module ALUMux (
		input wire [31:0]  WD, ImmExt,
		input wire	   ALUSrc,
		output wire [31:0] B
		);

   assign B = ALUSrc ? ImmExt : WD;

endmodule
