module somador_completo_Nbits_tb();
    reg [4:0] A, B;
    reg Cin;
    wire [4:0] S;
    wire Cout;

    somador_completo_Nbits #(5) uut (.A(A), .B(B), .Cin(Cin), .Cout(Cout), .S(S));

    initial begin
        A = 5'b00000; B = 5'b00001; Cin = 5'b0; #10;
        A = 5'b00011; B = 5'b00001; Cin = 5'b0; #10;
        A = 5'b00011; B = 5'b00010; Cin = 5'b1; #10;
        A = 5'b11111; B = 5'b11111; Cin = 5'b0; #10;
        A = 5'b00000; B = 5'b00000; Cin = 5'b0; #10;
        A = 5'b00000; B = 5'b00000; Cin = 5'b1; #10;
    end

    initial begin
        $display("\n");
        $monitor("Tempo: %0t | Cin: %b | A: %b | B: %b | Saida: %b | Cout: %b", $time, Cin, A, B, S, Cout);
    end

endmodule