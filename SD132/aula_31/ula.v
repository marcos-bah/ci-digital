module ula #(parameter N = 4)(
    input op,
    input [N-1:0] b,
    input [N:0] a,
    output [N:0] y
);

assign y = op ? (a + b) : (a - b);

endmodule