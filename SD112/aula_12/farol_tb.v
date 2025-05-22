module farol_tb;
    // Definição das variáveis de entrada e saída
    reg A, B, C, D;
    wire FA, FB, FC, FD;

    // Instanciação do módulo de teste
    farol dut (.A(A), .B(B), .C(C), .D(D), .FA(FA), .FB(FB), .FC(FC), .FD(FD));

    // Processo de teste
    initial begin
        // Cabeçalho para facilitar a leitura dos resultados
        $display("A B C D | FA FB FC FD");
        $monitor("%b %b %b %b | %b  %b  %b  %b", A, B, C, D, FA, FB, FC, FD);
        // Testa todas as combinações possíveis de entrada (0 a 15)
        A = 0; B = 0; C = 0; D = 0; #10;
        A = 0; B = 0; C = 0; D = 1; #10;
        A = 0; B = 0; C = 1; D = 0; #10;
        A = 0; B = 0; C = 1; D = 1; #10;
        A = 0; B = 1; C = 0; D = 0; #10;
        A = 0; B = 1; C = 0; D = 1; #10;
        A = 0; B = 1; C = 1; D = 0; #10;
        A = 0; B = 1; C = 1; D = 1; #10;
        A = 1; B = 0; C = 0; D = 0; #10;
        A = 1; B = 0; C = 0; D = 1; #10;
        A = 1; B = 0; C = 1; D = 0; #10;
        A = 1; B = 0; C = 1; D = 1; #10;
        A = 1; B = 1; C = 0; D = 0; #10;
        A = 1; B = 1; C = 0; D = 1; #10;
        A = 1; B = 1; C = 1; D = 0; #10;
        A = 1; B = 1; C = 1; D = 1; #10;
        $stop; // Finaliza a simulação
    end
endmodule
