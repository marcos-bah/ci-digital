module InstructionMemory(
			  input [31:0] 	A,
			  output [31:0] RD
	);

  reg [31:0] 				I_MEM_BLOCK[63:0];

   initial
     begin
	$readmemh("/home/aluno/Downloads/instructions.txt",I_MEM_BLOCK);
	  end

   assign RD = I_MEM_BLOCK[A[31:2]]; // word aligned

endmodule
