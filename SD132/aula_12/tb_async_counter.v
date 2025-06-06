// Testbench para o contador assincrono
module tb_async_counter;
    reg clk;
    reg rst;
    wire [2:0] q;
    
    // Instancia o modulo contador
    async_counter uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    
    // Gera um clock com periodo de 10 unidades de tempo
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Sequencia de teste
    initial begin
        rst = 1;
        #10 rst = 0;
        #100;
        $stop;
    end
    
    // Monitoramento
    initial begin
        $monitor("Tempo = %0t | rst = %b | q = %b (%d)", $time, rst, q, q);
    end
endmodule
