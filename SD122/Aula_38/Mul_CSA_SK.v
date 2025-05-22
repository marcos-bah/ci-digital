// Modulo Multiplicador usando CSA simplificado com apenas dois CSAs
module Mul_CSA_SK #(parameter WIDTH = 4) (
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
    wire [3:0] sum_lo, sum_hi;
    wire carry_out_lo, carry_out_hi;

    wire [3:0] sum_input_lo = sum_stage2[3:0];
    wire [2*WIDTH-1:0] carry_stage2_shifted = carry_stage2 << 1;
    wire [3:0] carry_input_lo = carry_stage2_shifted[3:0];

    wire [3:0] sum_input_hi = sum_stage2[7:4];
    wire [3:0] carry_input_hi = carry_stage2_shifted[7:4];

    // Parte baixa (bits 3:0)
    sklansky_4 skl_lo (
        .A(sum_input_lo),
        .B(carry_input_lo),
        .Cin(1'b0), // Nenhum carry inicial
        .Sum(sum_lo),
        .Cout(carry_out_lo)
    );

    // Parte alta (bits 7:4), recebe carry da parte baixa
    sklansky_4 skl_hi (
        .A(sum_input_hi),
        .B(carry_input_hi),
        .Cin(carry_out_lo), // Carry da parte baixa
        .Sum(sum_hi),
        .Cout(carry_out_hi)
    );

    assign product = {sum_hi, sum_lo};

endmodule
