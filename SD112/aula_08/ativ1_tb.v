module ativ1_tb();
    reg [1:0] A, B; // Entradas de 2 bits cada
    wire [3:0] Y1; // Saída de 4 bits

    // Instanciação do módulo a ser testado
    ativ1 dut (.A(A), .B(B), .Y1(Y1));

    integer i;
    initial begin
        $display("A  B  |  Y1 ");
        $monitor("%b %b |  %b ", A, B, Y1);
        // Testando todas as combinações possíveis das entradas (16 no total)
        for (i = 0; i < 16; i = i + 1) begin
            {A, B} = i; // Atribui valores binários para as entradas
            #10; // Aguarda 10 ns entre os testes
        end
        $stop;
    end
endmodule