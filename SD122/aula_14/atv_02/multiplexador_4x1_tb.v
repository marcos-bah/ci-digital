module multiplexador_4x1_tb ();
    reg S1, S0; // Entradas de seleção (B, C)
    reg I0, I1, I2, I3; // Entradas de dados
    wire Y; // Saída do multiplexador

	multiplexador_4x1 uut (S1, S0, I0, I1, I2, I3, Y);

	initial begin
    	$monitor("Entrada: %b | Seletora: %b | Saída: %b", {I0, I1, I2, I3}, {S1, S0}, Y);
    	I0 = 1; I1 = 0; I2 = 0; I3 = 0; S0 = 0; S1 = 0; #10;
        I0 = 0; I1 = 1; I2 = 0; I3 = 0; S0 = 1; S1 = 0; #10;
        I0 = 0; I1 = 0; I2 = 1; I3 = 0; S0 = 0; S1 = 1; #10;
        I0 = 0; I1 = 0; I2 = 0; I3 = 1; S0 = 1; S1 = 1; #10;
	end
    
endmodule