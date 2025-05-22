module csa ( input [3:0] A, B, Cin , output [3:0] Sum , Cout );
    assign Sum = A ^ B ^ Cin; // Soma
    assign Cout = (A & B) | (B & Cin ) | ( Cin & A); // Carry
endmodule