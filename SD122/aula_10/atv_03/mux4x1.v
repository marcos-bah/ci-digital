module mux4x1 #(parameter N = 3)(
    input [N-1:0] A,
    input [N-1:0] B,
    input [N-1:0] C,
    input [N-1:0] D,
    input [1:0] sel,
    output reg [N-1:0] out
);
    always @(*) begin
        case (sel)
            2'b00: out = A;
            2'b01: out = B;
            2'b10: out = C;
            2'b11: out = D;
            default: out = A;
        endcase
    end
endmodule