module ativ4_tb();
    reg [3:0] in; // Entradas de 4 bits
    wire out; // Saída do circuito

    // Instanciação do módulo a ser testado
    ativ4 uut (.IN(in),.Y(out));

    integer i;
    initial begin
        $display("Testando Tabela Verdade");
        $display("Entradas | Saída");
        $monitor("%b | %b", in, out);
        // Testando todas as combinações de entrada
        for (i = 0; i < 16; i = i + 1) begin
            in = i;
            #10; // Aguarda 10 ns entre os testes
        end
        $stop;
    end
endmodule