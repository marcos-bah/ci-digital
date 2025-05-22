module cod_binario16x4 (
    input wire [15:0] in,
    output reg [3:0] out
);

    wire [2:0] out1, out2;

    cod_binario8x3 i0 (.in(in[15:8]), .out(out1));
    cod_binario8x3 i1 (.in(in[7:0]), .out(out2));

    always @(*) begin
        if (in[15:8] | in[15:8]) begin //verifica bit a bit se algum valor é 1
            out = out1;
            out[3] = 1;
        end else begin
            out = out2;
            out[3] = 0;
        end
    end
endmodule