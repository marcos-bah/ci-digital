module ula_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] seletor;
    wire [3:0] resultado;

    ula uut (
        .A(A),
        .B(B),
        .seletor(seletor),
        .resultado(resultado)
    );

    initial begin
        $display("\n");
        $monitor("Tempo=%0t | A=%b B=%b seletor=%b => resultado=%b carry=%b", $time, A, B, seletor, resultado, carry_out);

        $display("AND");
        A = 4'b1010; B = 4'b1100; seletor = 3'b000; #10;

        $display("OR");
        A = 4'b1010; B = 4'b1100; seletor = 3'b001; #10;

        $display("Soma");
        A = 4'b1010; B = 4'b1111; seletor = 3'b010; #10;

        $display("NOT A");
        A = 4'b1010; B = 4'bxxxx; seletor = 3'b011; #10;

        $display("A AND (NOT B)");
        A = 4'b1010; B = 4'b1100; seletor = 3'b100; #10;

        $display("A OR (NOT B)");
        A = 4'b0101; B = 4'b0011; seletor = 3'b101; #10;

        $display("SUB");
        A = 4'b1000; B = 4'b1111; seletor = 3'b110; #10;

        $display("A Menor que B");
        A = 4'b1111; B = 4'b0010; seletor = 3'b111; #10;

        $finish;
    end
endmodule

