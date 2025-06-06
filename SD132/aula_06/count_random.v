module count_random (
    input clk, rst,
    output reg [3:0] out
);
    always @(negedge clk or negedge rst) begin
        if (!rst) 
            out <= 4'h1;
        else if(!clk) begin
            case (out)
                4'h1: out <= 4'h3;
                4'h3: out <= 4'h5;
                4'h5: out <= 4'h0;
                4'h0: out <= 4'h2;
                4'h2: out <= 4'h4;
                4'h4: out <= 4'h6;
                4'h6: out <= 4'h7;
                4'h7: out <= 4'h8;
                4'h8: out <= 4'h9;
                4'h9: out <= 4'hA;
                4'hA: out <= 4'hF;
                4'hF: out <= 4'hE;
                4'hE: out <= 4'hD;
                4'hD: out <= 4'hC;
                4'hC: out <= 4'hB;
                4'hB: out <= 4'h1;
                default: out <= 4'h1;
            endcase
        end
    end
endmodule