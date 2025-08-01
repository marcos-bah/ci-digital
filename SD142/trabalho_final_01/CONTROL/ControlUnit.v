module ControlUnit(
	input wire [6:0]  op,
	input wire [2:0]  funct3,
	input wire	      funct7b5, Zero, 

	output wire [1:0] ResultSrc,
	output wire	      MemWrite, PCSrc, ALUSrc, RegWrite,Jump,
	output wire [1:0] ImmSrc,
	output wire [3:0] ALUControl
);

   wire [1:0] ALUop;
   wire	Branch;
   
   MainDecoder Main_Decoder(
  			     .op(op),
			     .ResultSrc(ResultSrc),
			     .MemWrite(MemWrite),
			     .Branch(Branch),
  			     .ALUSrc(ALUSrc),
			     .RegWrite(RegWrite),
  			     .Jump(Jump),
			     .ImmSrc(ImmSrc),
			     .ALUop(ALUop) );
   
   ALUDecoder ALU_Decoder(
  			   .opb5(op[5]),
			   .funct3(funct3),
			   .funct7b5(funct7b5),
			   .ALUOp(ALUop),
			   .ALUControl(ALUControl) );
  
   assign PCSrc = Branch & Zero | Jump;

endmodule
