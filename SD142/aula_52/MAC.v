module MAC (
    input wire [7:0] A, input wire [7:0] B, // Operandos
    input wire clk, input wire rst, // Clock e Reset
    output wire [31:0] result_out // Resultado acumulado
);
    reg [15:0] product; // produto intermediário
    reg [31:0] result; // resultado final para realimentação

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            result <= 0; 
            product <= 0; 
        end else begin
            product <= A * B; // Multiplicação (síntese)
            result <= result + product; // Acumulação (síntese)
        end
    end
    assign result_out = result;
endmodule
// A implementação dos circuitos de soma e multiplicação é configurada na ferramenta de síntese