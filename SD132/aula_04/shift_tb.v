module shift_tb;

    parameter size = 4;
    parameter msb = size - 1;

    reg [msb:0] E;
    reg Er, El, clk, rst, load, dir;
    wire [msb:0] Y;

    shift #(size) uut (
        .E(E),
        .Er(Er),
        .El(El),
        .clk(clk),
        .rst(rst),
        .load(load),
        .dir(dir),
        .Y(Y)
    );

    initial clk = 0;
    always #5 clk = ~clk;  

    initial begin
        E = 4'b0000;
        Er = 0;
        El = 0;
        rst = 0;
        load = 0;
        dir = 0;

        $monitor("Time=%0d clk=%b rst=%b load=%b dir=%b E=%b Y=%b", $time, clk, rst, load, dir, E, Y);

        // Teste: Reset
        #2 rst = 1;
        #10 rst = 0;

        // Teste: Load
        #5 E = 4'b1010; load = 1;
        #10 load = 0;

        // Teste: Shift para direita (Er entra)
        #10 Er = 1; dir = 0;  // shift right
        #10;
        #10 Er = 0;  // outro shift
        #10;

        // Teste: Shift para esquerda (El entra)
        #10 El = 1; dir = 1;  // shift left
        #10;
        #10 El = 0;  // outro shift
        #10;

        // Teste: Outro Load
        #5 E = 4'b1100; load = 1;
        #10 load = 0;

        // Mais shifts
        #10 dir = 1; El = 1;
        #10;
        #10 dir = 0; Er = 0;
        #10;

        // Fim do teste
        #20 $finish;
    end

endmodule
