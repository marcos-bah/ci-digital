module mealy_1101(clk, input_bit, rst, output_bit);
input wire clk, input_bit, rst;
output reg output_bit;

reg [1:0] state;

localparam S0 = 2'd0, S1 = 2'd1, S2 = 2'd2, S3 = 2'd3;

always @(*) begin
    case (state)
        S3: if (input_bit) output_bit = 1'b1;
            else output_bit = 1'b0;
        default: output_bit = 1'b0;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= S0;
    else begin
        case (state)
            S0: if (input_bit) state <= S1;
                else state <= S0;

            S1: if (input_bit) state <= S2;
                else state <= S0;

            S2: if (input_bit) state <= S2;
                else state <= S3;

            S3: if (input_bit) state <= S1;
                else state <= S0;

            default: state <= S0;
        endcase
    end
end
endmodule
