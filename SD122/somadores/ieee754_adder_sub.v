module ieee754_adder_sub (
    input [31:0] a,
    input [31:0] b,
    input        op,
    output [31:0] result
);

    reg aMenor;
    reg [23:0] mantissa_a, mantissa_b;
    reg [24:0] mantissa_sum;
    reg [7:0] exp_diff;
    reg [7:0] expoente_maior, expoente_final;
    reg [4:0] shift;

    always @ (*) begin
        mantissa_a = {1'b1, a[22:0]};
        mantissa_b = {1'b1, b[22:0]};

        if (a[30:23] >= b[30:23]) begin
            exp_diff = a[30:23] - b[30:23];
            expoente_maior = a[30:23];
            mantissa_b = mantissa_b >> exp_diff;
        end else begin
            exp_diff = b[30:23] - a[30:23];
            expoente_maior = b[30:23];
            mantissa_a = mantissa_a >> exp_diff;
        end

        if (op) begin
            mantissa_sum = mantissa_a + mantissa_b;
            aMenor = 0;
        end else begin
            if (mantissa_a >= mantissa_b) begin
                mantissa_sum = mantissa_a - mantissa_b;
                aMenor = 0;
            end else begin
                mantissa_sum = mantissa_b - mantissa_a;
                aMenor = 1;
            end
        end

        if (mantissa_sum[24]) begin
            mantissa_sum = mantissa_sum >> 1;
            expoente_final = expoente_maior + 1;
        end else begin
            shift = 0;
            while (mantissa_sum[23 - shift] == 0 && shift < 23) begin
                shift = shift + 1;
            end
            mantissa_sum = mantissa_sum << shift;
            expoente_final = expoente_maior - shift;
        end
    end

    assign result[31] = aMenor;
    assign result[30:23] = expoente_final;
    assign result[22:0] = mantissa_sum[22:0];

endmodule
