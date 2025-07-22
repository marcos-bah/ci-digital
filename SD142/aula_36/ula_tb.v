module ula_tb;

    reg ena, clk;
    reg [3:0] op1, op2, op_sel;
    wire [3:0] res;
    wire ula_ack;

    ula uut (
        .ena(ena), .clk(clk),
        .op1(op1), .op2(op2), .op_sel(op_sel),
        .res(res), .ula_ack(ula_ack)
    );

    reg [3:0] expected;
    integer errors = 0;

    task verifica_saida;
        input [3:0] esperado;
        begin
            if (res !== esperado) begin
                $display("Erro: op_sel = %b, op1 = %b, op2 = %b => res = %b (esperado %b)", op_sel, op1, op2, res, esperado);
                errors = errors + 1;
            end else begin
                $display("OK: op_sel = %b, op1 = %b, op2 = %b => res = %b", op_sel, op1, op2, res);
            end
        end
    endtask


    initial begin
        $display("\nTestbench - ula");

        clk = 0;
        ena = 0;
        op1 = 0;
        op2 = 0;
        op_sel = 0;

        #5 ena = 1;

        // Testa OR
        op1 = 4'b1010; op2 = 4'b0101; op_sel = 4'b0100; #10;
        expected = op1 | op2; verifica_saida(expected);

        // Testa AND
        op1 = 4'b1100; op2 = 4'b1010; op_sel = 4'b0101; #10;
        expected = op1 & op2; verifica_saida(expected);

        // Testa XOR
        op1 = 4'b1111; op2 = 4'b0000; op_sel = 4'b0110; #10;
        expected = op1 ^ op2; verifica_saida(expected);

        // Testa NAND
        op1 = 4'b1111; op2 = 4'b1111; op_sel = 4'b0111; #10;
        expected = ~(op1 & op2); verifica_saida(expected);

        // Testa SOMA (com padrões 10xx)
        op1 = 4'd6; op2 = 4'd3; op_sel = 4'b1000; #10;
        expected = op1 + op2; verifica_saida(expected);

        op_sel = 4'b1011; #10;
        expected = op1 + op2; verifica_saida(expected);

        // Testa SUBTRAÇÃO (com padrões 11xx)
        op1 = 4'd9; op2 = 4'd5; op_sel = 4'b1100; #10;
        expected = op1 - op2; verifica_saida(expected);

        op_sel = 4'b1111; #10;
        expected = op1 - op2; verifica_saida(expected);

        // Testa default
        op1 = 4'd7; op2 = 4'd2; op_sel = 4'b0000; #10;
        expected = 4'b0000; verifica_saida(expected);

        $display("\nTestes finalizados. Erros encontrados: %0d", errors);
        $stop;
    end

    always #5 clk = ~clk;

endmodule
