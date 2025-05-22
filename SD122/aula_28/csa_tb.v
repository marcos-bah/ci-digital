module csa_tb ;
    reg [3:0] A, B, Cin ;
    wire [3:0] Sum , Cout ;

    csa uut (
        .A(A),
        .B(B),
        .Cin( Cin),
        .Sum( Sum),
        .Cout( Cout)
    );

    initial begin
        $display ("\nA B Cin | Sum Carry ");
        $monitor ("%b %b %b | %b %b", A, B, Cin , Sum , Cout );

        // Test cases
        A = 4'b1011 ; B = 4'b1101 ; Cin = 4'b0110 ; #10;
        A = 4'b1111 ; B = 4'b1111 ; Cin = 4'b0111 ; #10;
        A = 4'b0001 ; B = 4'b0010 ; Cin = 4'b0001 ; #10;
        A = 4'b0101 ; B = 4'b1010 ; Cin = 4'b0110 ; #10;
        A = 4'b1111 ; B = 4'b1111 ; Cin = 4'b1111 ; #10;

        $finish;
    end
endmodule