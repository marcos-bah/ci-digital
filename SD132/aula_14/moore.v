module moore (clk, input_bit, rst, output_bit);
input wire clk, input_bit, rst;
output reg output_bit;

reg [2:0] state;

localparam S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4;

always @(*) begin
    output_bit = 1'b0;
    case (state)
        S4: output_bit = 1'b1; 
        default: output_bit = 1'b0;
    endcase
end

always @(posedge clk, posedge rst) begin
    if (rst)
        state <= S0;
    else begin
            case (state)
                S0: if (input_bit) state <= S1; 
                    else state <= S0; 
                S1: if (input_bit) state <= S2; 
                    else state <= S0; 
                S2: if (input_bit) state <= S1; 
                    else state <= S3; 
                S3: if (input_bit) state <= S4; 
                    else state <= S0; 
                S4: if (input_bit) state <= S1; 
                    else state <= S0; 
            endcase
        end
    end
endmodule