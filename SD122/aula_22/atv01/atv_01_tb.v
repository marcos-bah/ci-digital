module atv_01_tb ();
    reg A, B;
    wire [3:0] D, Bw;

    atv01 uut (.A(A), .B(B), .Bw(Bw), .D(D));

    initial begin
        $display("\n");
        $monitor("A: %b | B: %b | Bw: %b | D: %b", A, B, Bw, D);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 1; #10;
        A = 1; B = 0; #10;
    end

endmodule