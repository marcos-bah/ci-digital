// Modulo Multiplicador usando CSA simplificado com apenas dois CSAs
module multiplier_csa #(parameter WIDTH = 4) (
    input  [WIDTH-1:0] multiplicand,
    input  [WIDTH-1:0] multiplier,
    output [2*WIDTH-1:0] product
);

    wire [2*WIDTH-1:0] partial_products [WIDTH-1:0];  // Produtos parciais estendidos
    wire [2*WIDTH-1:0] sum_stage1, sum_stage2;        // Somadores parciais
    wire [2*WIDTH-1:0] carry_stage1, carry_stage2;    // Carrys parciais

    // Geracao dos produtos parciais
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_partial_products
            assign partial_products[i] = multiplier[i] ? (multiplicand << i) : 0;
        end
    endgenerate

    // Primeira etapa: somar os primeiros dois produtos parciais
    parameterized_csa #(2*WIDTH) sk1 (
        .A(partial_products[0]),
        .B(partial_products[1]),
        .Cin(partial_products[2]),
        .Sum(sum_stage1),
        .Cout(carry_stage1)
    );

    // Segunda etapa: somar os resultados intermediarios
    parameterized_csa #(2*WIDTH) sk2 (
        .A(partial_products[3]),
        .B(sum_stage1),
        .Cin(carry_stage1 << 1),
        .Sum(sum_stage2),
        .Cout(carry_stage2)
    );

    // Produto final
    assign product = sum_stage2 + (carry_stage2 << 1); // Resultado final por RCA

endmodule
