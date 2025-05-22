module mux41_atv1_tb;

    reg [1:0] sel;  // Entradas de seleção
    reg [3:0] D;  // Entradas de dados
    wire Y;  // Saída do multiplexador

    // Instancia o multiplexador
    mux4x1 uut (
        .S(sel),
        .D(D),
        .Y(Y)
    );

    // Geração de sinais quadrados
    initial begin
        D = 4'b0000;
        forever #500 D[0] = ~D[0];  // 1 kHz
    end

    initial begin
        forever #250 D[1] = ~D[1];  // 2 kHz
    end

    initial begin
        forever #125 D[2] = ~D[2];  // 4 kHz
    end

    initial begin
        forever #62 D[3] = ~D[3];  // 8 kHz
    end

    // Testa a seleção do multiplexador
    initial begin
        sel = 2'b00; #2000;
        sel = 2'b01; #2000;
        sel = 2'b10; #2000;
        sel = 2'b11; #2000;
        $stop;
    end

endmodule
