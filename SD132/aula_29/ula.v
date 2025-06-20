module ula (
    input op,
    input [3:0] b,
    input [4:0] a,
    output [4:0] y
);

assign y = op ? (a + b) : (a - b);

endmodule