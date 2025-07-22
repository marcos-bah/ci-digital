module MAC (
input wire [7:0] A, B, // Operandos
input wire clk, rst, // Clock e Reset
output wire [31:0] Result // Resultado acumulado
);
//MACs podem ou nao ter o produto registrado
//Essa opcao afetara a maxima frequencia de operacao do mesmo
reg [15:0] product; // produto intermediario
reg [31:0] result_reg;  // result_regado final para realimentacao
always @(posedge clk or posedge rst) begin
    if(rst) begin
        result_reg <= 0; /*product <= 0;*/ end
    else begin
        product <= A * B; // Multiplicacao (sintese)
        result_reg <= result_reg + product ;//product; // Acumulacao (sintese)
    end
end
assign Result = result_reg;
endmodule
