module moore_seq_gen (
    input clk,
    input rst,
    input input_bit,
    output reg output_bit
);

reg [2:0] state;
reg start;

localparam S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, 
           S4 = 3'd4, S5 = 3'd5, S6 = 3'd6, S7 = 3'd7;

// Saída depende somente do estado (Moore)
always @(*) begin
    case (state)
        S1, S2, S6, S7: output_bit = 1'b1;
        default: output_bit = 1'b0;
    endcase
end

// Máquina de estados
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= S0;
        start <= 0;
    end else begin
        case (state)
            S0: begin
                if (input_bit && !start) begin
                    state <= S1;
                    start <= 1;
                end else begin
                    state <= S0;
                end
            end
            S1: state <= S2;
            S2: state <= S3;
            S3: state <= S4;
            S4: state <= S5;
            S5: state <= S6;
            S6: state <= S7;
            S7: begin
                state <= S0;
                start <= 0;
            end
        endcase
    end
end

endmodule
