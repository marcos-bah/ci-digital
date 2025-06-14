module controle(
    input clk, input rst,
    input HabA, input HabB, input HabC,
    output reg HabRegAB, HabRegS, LoadDesloca, Desloca, HabRegFim
);
    reg [2:0] estado;
    localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;

    always @(posedge clk or posedge rst) begin
        if (rst) estado <= S0;
        else begin
            case (estado)
                S0: estado <= S1;
                S1: estado <= S2;
                S2: estado <= S3;
                S3: estado <= S4;
                S4: estado <= S4;
            endcase
        end
    end

    always @(*) begin
        HabRegAB = 0; HabRegS = 0; LoadDesloca = 0;
        Desloca = 0; HabRegFim = 0;

        case (estado)
            S1: HabRegAB = 1;
            S2: HabRegS = 1;
            S3: LoadDesloca = 1;
            S4: begin
                Desloca = 1;
                HabRegFim = 1;
            end
        endcase
    end
endmodule
