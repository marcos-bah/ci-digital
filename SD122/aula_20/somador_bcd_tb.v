module somador_bcd_tb ();
    reg Cin;
    reg [3:0] A, B;
    wire [3:0] Y;
    wire Cout;

    integer i;

    somador_bcd uut (Cin, A, B, Y, Cout);

    initial begin
        $display("\n");
 
    	$monitor("Tempo: %0t | A = %b | B = %b | C_in = %b | C_out = %b | Y = %b ", $time, A, B, Cin, Cout, Y);

        for (i = 0; i < 10; i = i + 1) begin
        	A = i; B = i; Cin = 1'b0; #10;
    	end

        $finish;
    end
endmodule