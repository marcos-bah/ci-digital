module mealy_compl2 (
    input wire clk,
    input wire rst,
    input wire in,
    output reg out
);

localparam
    S_SEARCH = 2'b00,
    S_PASS   = 2'b01,
    S_INVERT = 2'b10;

reg [1:0] state;

always @(*) begin
    case (state)
        S_SEARCH: out = in;
        S_PASS: out = in;
        S_INVERT: out = ~in;
        default: out = 1'b0;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= S_SEARCH;
    else begin
        case (state)
            S_SEARCH: if (in) begin
                state <= S_PASS;
            end
            S_PASS: if (in) begin
                state <= S_INVERT;
            end
            S_INVERT: state <= S_INVERT;
            default: state <= S_SEARCH;
        endcase
    end
end

endmodule
