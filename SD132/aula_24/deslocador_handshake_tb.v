module deslocador_handshake_tb;

reg clk, rst, en;
reg [3:0] data_a, data_b;
wire [5:0] data_out;
wire fim;

deslocador_handshake uut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .data_a(data_a),
    .data_b(data_b),
    .data_out(data_out),
    .fim(fim)
);

initial begin
    $display("\nTestbench simples para deslocador_handshake");
    clk = 0; rst = 1; en = 0; data_a = 0; data_b = 0;
    #10 rst = 0;

    // Teste 1: deslocar 3 (0011) por 2
    #10 data_a = 4'b0011; data_b = 4'b0010; en = 1;
    #10 en = 0;

    // Teste 2: deslocar 5 (0101) por 1
    #20 data_a = 4'b0101; data_b = 4'b0001; en = 1;
    #10 en = 0;

    // Teste 3: deslocar 15 (1111) por 3
    #20 data_a = 4'b1111; data_b = 4'b0011; en = 1;
    #10 en = 0;

    #20 $finish;
end

always #5 clk = ~clk;

endmodule
