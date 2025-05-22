module ieee754_multiplier_tb;
    reg [31:0] a, b;
    // reg mul_div;
    wire [31:0] result;

    ieee754_multiplier uut (.a(a), .b(b), .result (result));

    initial begin
    $display ("\n Teste de multiplicacao de numeros em ponto flutuante");
    // Teste de multiplicacao : 4,75 * 2,125 = 10,09375 => 0 _10000010_01000011000000000000000
    a = 32'b0_10000001_00110000000000000000000; // 4,75
    b = 32'b0_10000000_00010000000000000000000; // 2,125
    #10;
    $display (" Multiplicacao 1: --> Sinal : %b -- Expoente : %b ---- Mantissa : %b", result [31], result [30:23], result [22:0]);

    // Teste de multiplicacao : 2,250 * 0,5 = 1,125 => 0 _10000000_00100000000000000000000 1001
    a = 32'b0_10000000_00100000000000000000000; // 2,250 
    b = 32'b0_01111110_00000000000000000000000; // 0,5  
    #10;
    $display (" Multiplicacao 2: --> Sinal : %b -- Expoente : %b ---- Mantissa : %b", result [31], result [30:23], result [22:0]);

    // Teste de multiplicacao : 4,0 * 2,0 = 8,0 => 0 _10000010_00000000000000000000000
    a = 32'b0_10000001_00000000000000000000000; // 4,0
    b = 32'b0_10000000_00000000000000000000000; // 2,0
    #10;
    $display (" Multiplicacao 3: --> Sinal : %b -- Expoente : %b ---- Mantissa : %b", result [31], result [30:23], result [22:0]);

    $finish; 
    end
endmodule