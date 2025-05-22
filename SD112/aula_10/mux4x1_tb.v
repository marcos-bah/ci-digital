module mux4x1_tb;

    reg [1:0] sel;  // Entradas de seleção
    reg D0, D1, D2, D3;  // Entradas de dados
    wire Y;  // Saída do multiplexador

    // Instancia o multiplexador
    mux4x1_3 uut (
        .S(sel),
        .D0(D0), .D1(D1), .D2(D2), .D3(D3),
        .Y(Y)
    );

    // Geração de sinais quadrados
    initial begin
        D0 = 0; D1 = 0; D2 = 0; D3 = 0;
        forever #500 D0 = ~D0;  
    end

    initial begin
        forever #250 D1 = ~D1;  
    end

    initial begin
        forever #125 D2 = ~D2;  
    end

    initial begin
        forever #62 D3 = ~D3;  
    end

    // Testa a seleção do multiplexador
    initial begin
        sel = 2'b00; #2000;  // Seleciona D0 
        sel = 2'b01; #2000;  // Seleciona D1 
        sel = 2'b10; #2000;  // Seleciona D2 
        sel = 2'b11; #2000;  // Seleciona D3 
        $stop;  // Encerra a simulação
    end

endmodule
