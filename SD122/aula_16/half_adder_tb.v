module half_adder_tb ();
    reg A, B;
    wire B1, B2, F, S, CB1, CB2, CF, CS;

    half_adder uut (A, B, B1, B2, F, S, CB1, CB2, CF, CS);

    initial begin
        $display("\n Meio Somador Testbench");
    	$monitor("Entrada: %b | Saida: %b | Carry: %b", {A, B}, {B1, B2, F, S}, {CB1, CB2, CF, CS});
    	A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
	end
endmodule