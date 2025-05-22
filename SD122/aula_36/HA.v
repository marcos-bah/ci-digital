// Módulo Half Adder (Meio Somador) - Descrição Comportamental
module HA(
    input A,        // Primeiro bit de entrada
    input B,        // Segundo bit de entrada
    output reg Sum, // Saída de soma (A ⊕ B)
    output reg Carry // Saída de transporte (A · B)
);

    // Bloco procedural always para calcular a saída
    always @(*) begin
        Sum = A ^ B;     // Soma (XOR)
        Carry = A & B;   // Transporte (AND)
    end

endmodule
