// Módulo Half Adder (Meio Somador) - Descrição Comportamental usando operação de soma
module half_adder_behave2 (
    input A,        // Primeiro bit de entrada
    input B,        // Segundo bit de entrada
    output reg Sum, // Saída de soma (A ⊕ B)
    output reg Carry // Saída de transporte (A · B)
);
    //assign  {Carry, Sum} = A+B// Implementação alternativa
    // Bloco procedural always para calcular a saída
    always @(*) begin
        {Carry, Sum} = A + B; // Soma binária com Carry e Sum
    end

endmodule
