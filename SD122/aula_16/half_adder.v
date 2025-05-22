module half_adder (
    input A, B,
    output B1, B2, F, S, CB1, CB2, CF, CS
);
    half_adder_behave1 i0 (.A(A), .B(B), .Sum(B1), .Carry(CB1));
    half_adder_behave2 i1 (.A(A), .B(B), .Sum(B2), .Carry(CB2));
    half_adder_flux i2 (.A(A), .B(B), .Sum(F), .Carry(CF));
    half_adder_struct i3 (.A(A), .B(B), .Sum(S), .Carry(CS));
endmodule
