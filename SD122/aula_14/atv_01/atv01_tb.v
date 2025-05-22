module atv01_tb ();
    reg A, B;
    wire Y;

	atv01 uut (A, B, Y);

	initial begin
    	$monitor("Entrada: %b | Saída: %b", {A, B}, Y);
    	A = 0; B = 0; #10;
        A = 1; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 1; #10;
	end
    
endmodule