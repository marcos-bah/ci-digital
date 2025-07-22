module SingleCycleCore(
			 input wire 	    clk,reset,
			 input wire [31:0]  Instr,
			 input wire [31:0]  ReadData,
			 output wire [31:0] PC,
			 output wire 	    MemWrite,
			 output wire [31:0] ALUResult,WriteData
			 );

   wire 				    ALUSrc, RegWrite, Jump, Zero, PCSrc;
   wire [1:0] 				    ResultSrc,ImmSrc;
   wire [3:0] 				    ALUControl;

   ControlUnit Control(
			.op(Instr[6:0]),
			.funct3(Instr[14:12]),
			.funct7b5(Instr[30]),
			.Zero(Zero),
			.ResultSrc(ResultSrc),
			.MemWrite(MemWrite),
			.PCSrc(PCSrc),
			.ALUSrc(ALUSrc),
			.RegWrite(RegWrite),
			.Jump(Jump),
			.ImmSrc(ImmSrc),
			.ALUControl(ALUControl)
			);

   Datapath Datapath(
			  .clk(clk),
			  .reset(reset),
			  .ResultSrc(ResultSrc),
			  .PCSrc(PCSrc),
			  .ALUSrc(ALUSrc),
			  .RegWrite(RegWrite),
			  .ImmSrc(ImmSrc),
			  .ALUControl(ALUControl),
			  .Instr(Instr),
			  .ReadData(ReadData),
			  .Zero(Zero),
			  .PC(PC),
			  .ALUResult(ALUResult),
			  .WriteData(WriteData)
			  );	

endmodule








