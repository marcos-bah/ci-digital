module CKTLUTSeno (
    input [6:0] angulo,
    output [15:0] seno
);

wire [3:0] address;

LUT_Seno U1(
    .address(address),
    .seno(seno)
);

DecodificadorLUTSeno U2(
    .angulo(angulo),
    .address(address)
);

endmodule
