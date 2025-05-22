module tb_carry_look_ahead_adder;

    // Entradas do DUT (Design Under Test)
    reg [3:0] A;
    reg [3:0] B;
    reg C_in;

    // Saídas do DUT
    wire [3:0] S;
    wire C_out;

    // Instância do módulo 
    struct_4bit_carry_look_ahead_adder dut (
        .A(A),
        .B(B),
        .Cin(C_in),
        .Sum(S),
        .Cout(C_out)
    );

    // behave_4bit_carry_lookahead_adder dut (
    //     .A(A),
    //     .B(B),
    //     .Cin(C_in),
    //     .Sum(S),
    //     .Cout(C_out)
    // );

    initial begin
        $display("\n");
        // Exibe os valores na simulação
        $monitor("Tempo: %0t | A = %b | B = %b | C_in = %b | S = %b | C_out = %b", $time, A, B, C_in, S, C_out);

        // Teste 1: Exemplo do problema
        A = 4'b1011; B = 4'b1101; C_in = 0;
        #10;

        // Teste 2: Soma sem carry final
        A = 4'b0101; B = 4'b0011; C_in = 0;
        #10;

        // Teste 3: Soma com carry propagado
        A = 4'b1110; B = 4'b0001; C_in = 0;
        #10;

        // Teste 4: Soma com carry inicial não nulo
        A = 4'b1001; B = 4'b0110; C_in = 1;
        #10;

        // Teste 5: Todos os bits em 1
        A = 4'b1111; B = 4'b1111; C_in = 0;
        #10;

        // Finalizar simulação
        $finish;
    end

endmodule
