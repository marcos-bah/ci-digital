module atv01 (
    input A,      
    input B,      
    output [3:0] D,     
    output [3:0] Bw
);

    half_sub_struct i0(.A(A), .B(B), .Borrow(Bw[0]), .D(D[0]));
    half_sub_behave i1(.A(A), .B(B), .Borrow(Bw[1]), .D(D[1]));
    half_sub_data i2(.A(A), .B(B), .Borrow(Bw[2]), .D(D[2]));
    half_sub_behave_alt i3(.A(A), .B(B), .Borrow(Bw[3]), .D(D[3]));
endmodule