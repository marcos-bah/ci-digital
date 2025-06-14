module soma_subtrator (
    input [3:0] a,
    input [3:0] b,
    input op,
    output [3:0] resultado,
    output carryout,
    output overflow
);

wire [3:0] b_invertida;
wire [4:0] soma_ext;

assign b_invertida = b ^ {4{op}};
assign soma_ext = {1'b0, a} + {1'b0, b_invertida} + op;
assign resultado = soma_ext[3:0];
assign carryout = soma_ext[4];
assign overflow = (~(a[3] ^ b_invertida[3])) & (resultado[3] ^ a[3]);

endmodule
