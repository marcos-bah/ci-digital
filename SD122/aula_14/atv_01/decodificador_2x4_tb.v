module decodificador_2x4_tb ();
    reg A0, A1;
    wire Y0, Y1, Y2, Y3;

	decodificador_2x4 uut (A0, A1, Y0, Y1, Y2, Y3);

	initial begin
    	$monitor("Entrada: %b | Saída: %b", {A0, A1}, {Y0, Y1, Y2, Y3});
    	A0 = 0; A1 = 0; #10;
        A0 = 1; A1 = 0; #10;
        A0 = 0; A1 = 1; #10;
        A0 = 1; A1 = 1; #10;
	end
    
endmodule