module atv02 (
    input A,      
    input B,  
    input [4:0] Bin,    
    output [4:0] D,     
    output [4:0] Bw
);

    full_sub_behave_alt i0(.A(A), .B(B), .BorrowIn(Bin[0]), .BorrowOut(Bw[0]), .D(D[0]));
    full_sub_behave i1(.A(A), .B(B), .BorrowIn(Bin[1]), .BorrowOut(Bw[1]), .D(D[1]));
    full_sub_data i2(.A(A), .B(B), .BorrowIn(Bin[2]), .BorrowOut(Bw[2]), .D(D[2]));
    full_sub_struct_alt i3(.A(A), .B(B), .BorrowIn(Bin[3]), .BorrowOut(Bw[3]), .D(D[3]));
    full_sub_strutct i4(.A(A), .B(B), .BorrowIn(Bin[4]), .BorrowOut(Bw[4]), .D(D[4]));

endmodule