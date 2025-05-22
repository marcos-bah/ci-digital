module BrentKungAdder4_tb();
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum ;
    wire Cout ;

    BrentKungAdder4 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $display ("A B Cin | Cout Sum ") ;
        $monitor ("%b %b %b | %b %b", A, B, Cin , Cout , Sum );

        // Test cases
        A = 4'b1101; B = 4 'b1011; Cin = 1'b0; #10;
        A = 4'b1111; B = 4 'b1111; Cin = 1'b1; #10;
        A = 4'b1111; B = 4 'b1111; Cin = 1'b0; #10;

        $finish;
    end
endmodule