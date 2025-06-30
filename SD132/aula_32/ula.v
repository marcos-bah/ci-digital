module ula (
    input ena, clk,
    input [3:0] op1, op2, op_sel,
    output reg [3:0] res,
    output reg ula_ack
);
    always @(posedge clk) begin
        if (ena) begin
            ula_ack <= 0;
            casex (op_sel)
                4'b0100: res <= op1 | op2;
                4'b0101: res <= op1 & op2;
                4'b0110: res <= op1 ^ op2;
                4'b0111: res <= ~(op1 & op2);
                4'b10xx: res <= op1 + op2;
                4'b11xx: res <= op1 - op2;
                default: res <= 4'b0000;
            endcase
            ula_ack <= 1;
        end else begin
            ula_ack <= 0;
        end
    end
endmodule