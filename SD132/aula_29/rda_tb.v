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

        $stop;
    end

endmodule
