module Multiplicador_8bits_TB();
parameter DATA_LENGTH = 8;

reg St, Clk, rst;
reg [DATA_LENGTH-1:0] Multiplicando, Multiplicador;
wire Idle, Done;
wire [(DATA_LENGTH*2)-1:0] Produto;

Multiplicador #(DATA_LENGTH) dut (
    .St(St),
    .Clk(Clk),
    .rst(rst),
    .Multiplicando(Multiplicando),
    .Multiplicador(Multiplicador),
    .Idle(Idle),
    .Done(Done),
    .Produto(Produto)
);

always #10 Clk = ~Clk;

reg test;
integer i, j;

initial begin
    Clk = 0;
    St = 0;
    rst = 1;
    #10 rst = 0;
    test = 1;

    for (i = 0; i < 2**4; i = i + 1) begin
        for (j = 0; j < 2**4; j = j + 1) begin
            Multiplicando = i;
            Multiplicador = j;
            St = 1;
            #20;
            St = 0;
            wait (Done == 1);
            #35;
            if (Produto !== (i * j)) begin
                $display("Erro: A = %d, B = %d, Produto = %d", Multiplicando, Multiplicador, Produto);
                test = 0;
            end
        end
    end

    if (test) 
        $display("Teste bem-sucedido");
    else
        $display("Teste falhou");

    $finish;
end

endmodule
