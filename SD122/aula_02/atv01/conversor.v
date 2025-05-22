module conversor(H,G,F,E,D,C,B,A);
input H,G,F,E;
output D,C,B,A;

conversorA cA (.H(H), .G(G), .F(F), .E(E), .A(A));
conversorB cB (.H(H), .G(G), .F(F), .E(E), .B(B));
conversorC cC (.H(H), .G(G), .F(F), .E(E), .C(C));
conversorD cD (.H(H), .G(G), .F(F), .E(E), .D(D));

endmodule