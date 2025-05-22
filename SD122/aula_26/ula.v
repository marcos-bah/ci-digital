module ula (
   input  [3:0] A,         // Operando A
   input  [3:0] B,         // Operando B
   input  [2:0] seletor,   // Sinal de seleção (3 bits)
   output reg [3:0] resultado, // Resultado da operação
   output reg carry_out
);

   reg [4:0] aux;

   always @(*) begin
       carry_out = 0;

       case (seletor)
           3'b000: resultado = A & B;       // Operação AND
           3'b001: resultado = A | B;       // Operação OR
           3'b010: {carry_out, resultado} = A + B;       // Soma
           3'b011: resultado = ~A;          // Operação NOT (aplica-se apenas ao operando A)
           3'b100: resultado = A & (~ B);    // A AND (NOT B)
           3'b101: resultado = A || (~ B);   // A OR (NOT B) 
           3'b110: begin
            aux = {1'b0, A} - {1'b0, B};
            carry_out = ~aux[4];
            resultado = aux[3:0];
           end // Subtração
           3'b111: resultado = A < B; // A Menor que B
           default: resultado = 4'b0000;    // Operação padrão (zero)
       endcase
   end
endmodule