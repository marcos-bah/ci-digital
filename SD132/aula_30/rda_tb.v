module rda_tb;

    reg clk, rst, start;
    reg [3:0] dividendo, divisor;
    wire [3:0] regQ;
    wire [4:0] regA;
    wire [2:0] count;

    rda uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .dividendo(dividendo),
        .divisor(divisor),
        .regQ(regQ),
        .regA(regA),
        .count(count)
    );

    initial begin
        $display("\nTESTBENCH DO MÓDULO RDA");
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    integer i, j, quociente_esperado, resto_esperado;
    integer erro = 0;

    initial begin
        rst = 1;
        start = 0;
        dividendo = 0;
        divisor = 0;
        #10;

        rst = 0;
        #10;

        // Teste 1
        dividendo = 11;
        divisor = 5;
        start = 1;
        #10;
        start = 0;
        #200;
        $display("Dividendo: %d | Divisor: %d | Quociente: %d | Resto: %d", dividendo, divisor, regQ, regA);

        rst = 1; #10; rst = 0; #10

        // Teste 2
        dividendo = 13;
        divisor = 3;
        start = 1;
        #10;
        start = 0;
        #200;
        $display("Dividendo: %d | Divisor: %d | Quociente: %d | Resto: %d", dividendo, divisor, regQ, regA);

        rst = 1; #10; rst = 0; #10

        // Teste 3
        dividendo = 15;
        divisor = 15;
        start = 1;
        #10;
        start = 0;
        #200;
        $display("Dividendo: %d | Divisor: %d | Quociente: %d | Resto: %d", dividendo, divisor, regQ, regA);

        rst = 1; #10; rst = 0; #10

        // Teste 4
        dividendo = 15;
        divisor = 1;
        start = 1;
        #10;
        start = 0;
        #200;
        $display("Dividendo: %d | Divisor: %d | Quociente: %d | Resto: %d", dividendo, divisor, regQ, regA);

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 1; j < 16; j = j + 1) begin // divisor != 0
                dividendo = i;
                divisor = j;
                start = 1;
                #10;
                start = 0;
                #200;
        
                quociente_esperado = i / j;
                resto_esperado = i % j;
        
                if (regQ !== quociente_esperado || regA !== resto_esperado) begin
                    $display("ERRO - Dividendo: %2d | Divisor: %2d | Q: %2d (Esperado: %2d) | R: %2d (Esperado: %2d)", 
                              i, j, regQ, quociente_esperado, regA, resto_esperado);
                    erro = 1;
                end
        
                rst = 1; #10;
                rst = 0; #10;
            end
        end
        
        if (erro == 0)
            $display("Todos os testes foram realizados com sucesso!");
        
        $stop;
    end

endmodule
