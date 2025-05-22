module ieee754_multiplier (
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] result
);
    wire sign_a, sign_b ;
    wire [7:0] exp_a, exp_b ;
    wire [23:0] mantissa_a, mantissa_b ;
    reg [47:0] mantissa_mul ;
    reg [8:0] exp_result ; // Usar 9 bits para o expoente
    reg sign_result ;
    reg [23:0] mantissa_result ;
    integer shift ;

    // Separar os campos dos numeros de entrada
    assign sign_a = a [31];
    assign exp_a = a [30:23];
    assign mantissa_a = (exp_a == 0) ? 24'd0 : {1'b1, a [22:0]}; // Adicionar bit implicito
    assign sign_b = b [31];
    assign exp_b = b [30:23];
    assign mantissa_b = (exp_b == 0) ? 24'd0 : {1'b1, b [22:0]}; // Adicionar bit implicito

    always @ (*) begin
        // Tratamento de multiplicacao por zero
        if ((exp_a == 0 && a [22:0] == 0) || (exp_b == 0 && b [22:0] == 0)) begin
            result = 32'b0;
        end else begin
            // Definir o sinal do resultado
            sign_result = sign_a ^ sign_b ;

            // Multiplicacao das mantissas
            mantissa_mul = mantissa_a * mantissa_b ;

            // Calcular novo expoente (soma dos expoentes com correcao do bias)
            exp_result = (exp_a - 8'd127) + (exp_b - 8'd127) + 7'd127 ; // Remover e adicionar o bias de 127

            // Normalizacao : encontrar o primeiro bit 1 mais significativo
            shift = 0;
            while (mantissa_mul [47 - shift ] == 0 && shift < 48) begin
                shift = shift + 1;
            end

            mantissa_result = mantissa_mul [47:24] << shift ; // Apenas os 23 bits mais significativos

            // Ajustar o expoente pela normalizacao
            exp_result = exp_result - shift + 1; // Subtrair o numero de deslocamentos ate apos o 1 mais significativo

            // Construir o resultado final
            result = { sign_result, exp_result [7:0], mantissa_result [22:0]};
        end
    end
endmodule