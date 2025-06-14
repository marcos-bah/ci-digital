module fsm (
    input rst, clk,
    input fimA, fimB, fimOp,
    output reg habA, habB, habOp
);

    localparam
        S_S0 = 2'b00, // Espera / leitura do resultado
        S_S1 = 2'b01, // Carrega operandos A e B
        S_S2 = 2'b10; // Carrega resultado

    reg [1:0] state;

    always @(*) begin
        habA = 0;
        habB = 0;
        habOp = 0;

        case(state)
            S_S1: begin
                habA = 1;
                habB = 1;
            end
            S_S2: begin
                habOp = 1;
            end

            default: begin
                habA = 0;
                habB = 0;
                habOp = 0;
            end

        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S_S0;
        end else begin
            case (state)
                S_S0: state <= S_S1;

                S_S1: begin
                    if (fimA & fimB)
                        state <= S_S2;
                    else
                        state <= S_S1;
                end

                S_S2: begin
                    if (fimOp)
                        state <= S_S0;
                    else
                        state <= S_S2;
                end

                default: state <= S_S0;
            endcase
        end
    end

endmodule