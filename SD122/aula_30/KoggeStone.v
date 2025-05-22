module KoggeStone (
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [3:0] P, G, P_1, G_1, P_2, G_2; 
    wire [4:0] C;

    // Nivel 0
    assign P = A ^ B;
    assign G = A & B;

    assign G[0] = (A[0] & B[0]) | (Cin & B[0]) | (A[0] & Cin);

    // Nivel 1
    assign P_1[1] = P[1] & P[0];
    assign P_1[2] = P[2] & P[1];
    assign P_1[3] = P[3] & P[2];

    assign G_1[1] = G[1] | P[1] & G[0]; 
    assign G_1[2] = G[2] | P[2] & G[1]; 
    assign G_1[3] = G[3] | P[3] & G[2]; 

    // Nivel 2
    assign P_2[2] = P_1[2] & P_1[0];
    assign G_2[2] = G_1[2] | P_1[2] & G[0];

    assign P_2[3] = P_1[3] & P_1[1];
    assign G_2[3] = G_1[3] | P_1[3] & G_1[1];

    //Carry
    assign C[0] = Cin;
    assign C[1] = G[0];
    assign C[2] = G_1[1];
    assign C[3] = G_2[2];
    assign C[4] = G_2[3];

    assign Sum = A ^ B ^ C;
    assign Cout = C[4];

endmodule