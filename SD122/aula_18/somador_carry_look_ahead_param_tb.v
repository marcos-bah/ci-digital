module somador_carry_look_ahead_param_tb();

    // Entradas do DUT (Design Under Test)
    reg [7:0] A;
    reg [7:0] B;
    reg C_in;

    // Saídas do DUT
    wire [7:0] S;
    wire C_out;

    // Instância do módulo Carry Look-Ahead Adder
    somador_carry_look_ahead_param #(8) dut (
        .A(A),
        .B(B),
        .C_in(C_in),
        .S(S),
        .C_out(C_out)
    );

    initial begin
        $display("\n");
        // Exibe os valores na simulação
        $monitor("Tempo: %0t | A = %b | B = %b | C_in = %b | S = %b | C_out = %b", $time, A, B, C_in, S, C_out);

        // Teste 1: Exemplo do problema
        A = 8'b1011_1011; B = 8'b1101_1101; C_in = 0;
        #10;

        // Teste 2: Soma sem carry final
        A = 8'b0101_0101; B = 8'b0011_0011; C_in = 0;
        #10;

        // Teste 3: Soma com carry propagado
        A = 8'b1110_1110; B = 8'b0001_0001; C_in = 0;
        #10;

        // Teste 4: Soma com carry inicial não nulo
        A = 8'b1001_1001; B = 8'b0110_0110; C_in = 1;
        #10;

        // Teste 5: Todos os bits em 1
        A = 8'b1111_1111; B = 8'b1111_1111; C_in = 0;
        #10;

        // Finalizar simulação
        $finish;
    end

endmodule
