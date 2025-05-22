module ieee754_adder_tb;
    reg [31:0] a, b;
    wire [31:0] result;

    ieee754_adder uut (.a(a), .b(b), .result(result));

    initial begin
        $display ("\n Teste de soma de numeros em ponto flutuante");
        // Teste de soma : 4,75 + 2,125 = 6,875 = > 0_10000001_10111000000000000000000
        a = 32'b0_10000001_00110000000000000000000; // 4,75
        b = 32'b0_10000000_00010000000000000000000; // 2,125
        // add_sub = 0; // Soma
        #10;
        $display (" Soma 1: --> Sinal : %b -- Expoente : %b ---- Mantissa : %b", result [31], result [30:23], result [22:0]);

         // Teste de Soma : 2,250 * 0,5 = 1,125 => 0 _10000000_00100000000000000000000 1001
        a = 32'b0_10000000_00100000000000000000000; // 2,250 
        b = 32'b0_01111110_00000000000000000000000; // 0,5  
        #10;
        $display (" Soma 2: --> Sinal : %b -- Expoente : %b ---- Mantissa : %b", result [31], result [30:23], result [22:0]);

        // Teste de Soma : 4,0 * 2,0 = 8,0 => 0 _10000010_00000000000000000000000
        a = 32'b0_10000001_00000000000000000000000; // 4,0
        b = 32'b0_10000000_00000000000000000000000; // 2,0
        #10;
        $display (" Soma 3: --> Sinal : %b -- Expoente : %b ---- Mantissa : %b", result [31], result [30:23], result [22:0]);
        $finish;
    end
endmodule
