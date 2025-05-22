module demux14_atv2_tb;
    reg S1, S0;  // Entradas de seleção
    reg D;       // Entrada de dados
    wire Y0, Y1, Y2, Y3;  // Saídas do demultiplexador

    // Instancia o demultiplexador
    demux1x4 uut (
        .S1(S1), .S0(S0),
        .D(D),
        .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3)
    );

    // Geração do sinal de entrada
    initial begin
        D = 1;
        S1 = 0; S0 = 0; #500;
        S1 = 0; S0 = 1; #500;
        S1 = 1; S0 = 0; #500;
        S1 = 1; S0 = 1; #500;
        $stop;
    end

endmodule