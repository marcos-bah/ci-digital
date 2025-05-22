module sklansky_4(
    input  [3:0] A, B,
    input  Cin,
    output [3:0] Sum,
    output Cout
);

wire GOa, GOb, GOc;
assign GOa = A[0] & Cin;
assign GOb = B[0] & Cin;
assign GOc = A[0] & B[0];

wire [3:0] G0, P0;
assign G0[0] = GOa | GOb | GOc;
assign G0[3:1] = A[3:1] & B[3:1];
assign P0 = A ^ B;

wire [3:0] G1, P1;
assign G1[0] = G0[0];
assign P1[0] = P0[0];
assign G1[1] = G0[1] | (P0[1] & G0[0]);
assign P1[1] = P0[1] & P0[0];
assign G1[2] = G0[2];
assign P1[2] = P0[2];
assign G1[3] = G0[3] | (P0[3] & G0[2]);
assign P1[3] = P0[3] & P0[2];

wire [3:0] G2, P2;
assign G2[0] = G1[0];
assign P2[0] = P1[0];
assign G2[1] = G1[1];
assign P2[1] = P1[1];
assign G2[2] = G1[2] | (P1[2] & G1[1]);
assign P2[2] = P1[2];
assign G2[3] = G1[3] | (P1[3] & G1[1]);
assign P2[3] = P1[3];

wire [4:0] C;
assign C[0] = Cin;
assign C[1] = G0[0];
assign C[2] = G1[1];
assign C[3] = G2[2];
assign C[4] = G2[3];

assign Cout = C[4];
assign Sum = P0 ^ C[3:0];

endmodule
