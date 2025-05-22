module monitoramento_pressao_tb();
    reg [7:0] pressao;  // Registro para simular a leitura do sensor
    wire [1:0] alerta;  // Saída do sistema de alerta

    // Instancia o módulo monitoramento_pressao
    monitoramento_pressao #(
        .N(8),                    // Largura de 8 bits
        .LIMITE_BAIXO(8'd50),     // Limite inferior
        .LIMITE_ALTO(8'd150)      // Limite superior
    ) dut (
        .pressao(pressao),
        .alerta(alerta)
    );

    // Estímulos de teste
    initial begin
        // Testa várias leituras de pressão
        pressao = 8'd30;  // Pressão baixa (abaixo de LIMITE_BAIXO)
        #10;
        pressao = 8'd70;  // Pressão normal (dentro da faixa)
        #10;
        pressao = 8'd160; // Pressão alta (acima de LIMITE_ALTO)
        #10;
        pressao = 8'd120; // Pressão normal (dentro da faixa)
        #10;
        pressao = 8'd45;  // Pressão baixa (abaixo de LIMITE_BAIXO)
        #10;
        pressao = 8'd150; // Pressão alta (no limite superior)
        #10;
        // Encerra simulação
        $stop;
    end

    // Exibe as saídas no terminal
    initial begin
        $monitor("Tempo=%0t | Pressão=%d | Alerta=%b", $time, pressao, alerta);
    end

endmodule
