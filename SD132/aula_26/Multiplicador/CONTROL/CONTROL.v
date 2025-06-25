module CONTROL(
    input  Clk, k, St, M, rst,
    output reg Idle, Done, Load, Sh, Ad
);

reg [1:0] state;
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

always @(posedge Clk, posedge rst) begin
    if (rst) begin
        state <= S0;
        {Idle, Done, Load, Sh, Ad} <= 5'b00000;
    end else begin
        case (state)
            S0: if (St) state <= S1;
            S1: state <= S2;
            S2: if (k) state <= S3; else state <= S1;
            S3: state <= S0;
            default: state <= S0;
        endcase
    end
end

always @(*) begin
    case (state)
        S0: begin
            Ad    <= 0;
            Sh    <= 0;
            Load  <= 0;
            Idle  <= 1;
            Done  <= 0;
            if (St) Load <= 1;
        end
        S1: begin
            Sh    <= 0;
            Load  <= 0;
            Idle  <= 0;
            Done  <= 0;
            if (M) Ad <= 1; else Ad <= 0;
        end
        S2: begin
            Sh    <= 1;
            Ad    <= 0;
            Load  <= 0;
            Idle  <= 0;
            Done  <= 0;
        end
        S3: begin
            Ad    <= 0;
            Sh    <= 0;
            Load  <= 0;
            Idle  <= 0;
            Done  <= 1;
        end
    endcase
end

endmodule