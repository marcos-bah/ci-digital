module drink_tb;

reg clk, rst, confirma, moeda;
reg [1:0] op;
wire entrega_agua, entrega_fanta, entrega_guarana;
wire sinal_devolve;
wire [3:0] troco, saldo;

drink uut (
    .clk(clk),
    .rst(rst),
    .confirma(confirma),
    .moeda(moeda),
    .op(op),
    .entrega_agua(entrega_agua),
    .entrega_fanta(entrega_fanta),
    .entrega_guarana(entrega_guarana),
    .sinal_devolve(sinal_devolve),
    .troco(troco),
    .saldo(saldo)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 0;
    confirma = 0;
    moeda = 0;
    op = 2'b00;

    $display("Início da simulação");
    $monitor("t=%0t | op=%b | saldo=%d | água=%b fanta=%b guarana=%b | troco=%d | devolve=%b", 
        $time, op, saldo, entrega_agua, entrega_fanta, entrega_guarana, troco, sinal_devolve);

    rst = 1; #20;
    rst = 0;

    // Teste 1: Comprar Água (R$2,00 = 4 moedas)
    op = 2'b00;
    repeat (4) begin
        moeda = 1; #10; moeda = 0; #10;
    end
    confirma = 1; #10; confirma = 0; #40;

    // Teste 2: Tentar comprar Guaraná (R$2,50 = 5 moedas), inserir apenas 3
    op = 2'b10;
    repeat (3) begin
        moeda = 1; #10; moeda = 0; #10;
    end
    confirma = 1; #10; confirma = 0; #40;

    // Teste 3: Comprar Fanta (R$3,00 = 6 moedas), inserir 7 (troco de 1)
    op = 2'b01;
    repeat (7) begin
        moeda = 1; #10; moeda = 0; #10;
    end
    confirma = 1; #10; confirma = 0; #40;

    $finish;
end

endmodule
