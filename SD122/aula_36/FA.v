module FA #(parameter N = 4) (
    input [N-1:0] A,       // Primeiro número de N bits
    input [N-1:0] B,       // Segundo número de N bits
    input Cin,           // Carry in
    output [N-1:0] S,      // Resultado da soma (N bits)
    output Cout          // Carry out
);
reg [N:0] resultado;     // Registrador para armazenar o resultado da soma (N bits: soma + carry out)
// Bloco procedural para realizar a soma
always @(*) begin
    resultado = A + B + Cin; // Soma dos dois números de N bits mais o carry in
end
assign S = resultado[N-1:0];  // Os N bits menos significativos são atribuídos à saída S
assign Cout = resultado[N]; // O bit mais significativo é o carry out
endmodule
