module reg6_handshake (
    input clk, rst, en,
    input [5:0] data_in,
    output reg [5:0] data_out,
    output reg fim
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 6'b000000;
            fim <= 1'b0;
        end else begin
            if (en) begin 
                data_out <= data_in;
                if (data_out == data_in) begin
                    fim <= 1'b1;
                end
            end else begin 
                fim <= 1'b0;
            end
        end
    end
endmodule