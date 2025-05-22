module somador_3b_tb;
    reg [2:0] A, B;    // Entradas de 3 bits
    reg Cin;           // Carry-in
    wire [2:0] S;      // Saída da soma
    wire Cout;         // Carry-out

    // Instanciando o módulo do somador
    somador_3b uut (
        .A(A), .B(B), .Cin(Cin),
        .S(S), .Cout(Cout)
    );

    integer i;

    // Procedimento de teste
    initial begin
        $display("A   B   Cin | S   Cout"); 
        $display("--------------------");
        
        // Testa todas as combinações possíveis (2^7 = 128)
        for (i = 0; i < 128; i = i + 1) begin
            {A, B, Cin} = i;  // Atribui valores binários automaticamente
            #10; // Espera 10 ns para simulação
            $display("%b %b  %b   | %b  %b", A, B, Cin, S, Cout);
        end

        $finish; // Encerra a simulação
    end
endmodule
