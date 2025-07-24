module alu_tb();

  reg signed [31:0] A, B;
  reg signed [3:0] ALUControl;
  wire signed Zero;
  wire signed [31:0] Result;

  alu uut (
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Zero(Zero),
    .Result(Result)
  );

  initial begin
    // Testes automáticos para cada operação da ALU
    // Caso 1: Soma
    A = 32'd15; B = 32'd5; ALUControl = 4'b0000; #10;
    if (Result !== 32'd20) $display("\nErro na soma: %d + %d = %d, esperado 20", A, B, Result);

    // Caso 2: Subtração
    A = 32'd15; B = 32'd5; ALUControl = 4'b0001; #10;
    if (Result !== 32'd10) $display("Erro na subtração: %d - %d = %d, esperado 10", A, B, Result);

    // Caso 3: AND
    A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; ALUControl = 4'b0010; #10;
    if (Result !== 32'h00000000) $display("Erro no AND: %h & %h = %h, esperado 00000000", A, B, Result);

    // Caso 4: OR
    A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; ALUControl = 4'b0011; #10;
    if (Result !== 32'hFFFFFFFF) $display("Erro no OR: %h | %h = %h, esperado FFFFFFFF", A, B, Result);

    // Caso 5: XOR
    A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; ALUControl = 4'b0100; #10;
    if (Result !== 32'hFFFFFFFF) $display("Erro no XOR: %h ^ %h = %h, esperado FFFFFFFF", A, B, Result);

    // Caso 6: SLT (Signed Less Than)
    A = 32'd5; B = 32'd9; ALUControl = 4'b0101; #10;
    if (Result !== 32'd1) $display("Erro no SLT: %d < %d = %d, esperado 1", A, B, Result);

    // Caso 7: SLTU (Unsigned Less Than)
    A = 32'd5; B = 32'd9; ALUControl = 4'b0110; #10;
    if (Result !== 32'd1) $display("Erro no SLTU: %d < %d = %d, esperado 1", A, B, Result);

    // Caso 11: SLL (Shift Left Logical)
    A = 32'd2; B = 32'd2; ALUControl = 4'b1010; #10;
    if (Result !== 32'd8) $display("Erro no SLL: %d << %d = %d, esperado 8", A, B, Result);

    // Caso 12: SRA (Shift Right Arithmetic)
    A = 32'd5; B = 32'd1; ALUControl = 4'b1011; #10;
    if (Result !== 32'd2) $display("Erro no SRA: %d >>> %d = %d, esperado 2", A, B, Result);

    // Caso 13: SRL (Shift Right Logical)
    A = 32'd5; B = 32'd1; ALUControl = 4'b1100; #10;
    if (Result !== 32'd2) $display("Erro no SRL: %d >> %d = %d, esperado 2", A, B, Result);

    // Verificando Zero Flag
    A = 32'd0; B = 32'd0; ALUControl = 4'b0000; #10;
    if (Zero !== 1) $display("Erro na flag Zero: esperado 1, encontrado %b", Zero);

    A = 32'd1; B = 32'd1; ALUControl = 4'b0000; #10;
    if (Zero !== 0) $display("Erro na flag Zero: esperado 0, encontrado %b", Zero);

    $finish;
  end

endmodule
