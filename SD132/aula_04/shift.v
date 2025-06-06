module shift #(parameter size = 8, msb = size - 1) (
    input [msb: 0] E,
    input Er, El, clk, rst, load, dir,
    output reg [msb: 0] Y
);

    always @(posedge clk) begin
        if (rst) begin
            Y <= 4'b0000;
        end else if (load) begin
            Y <= E;
        end else begin
            if (dir) begin
                // Deslocamento à esquerda
                Y <= {Y[msb-1:0], El};
            end else begin
                // Deslocamento à direita
                Y <= {Er , Y[msb:1]};
            end
        end
    end
endmodule