module deslocador_handshake (
    input clk, rst, en,
    input [3:0] data_a,
    input [3:0] data_b,
    output reg [5:0] data_out,
    output reg fim
); 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 6'b000000;
            fim <= 1'b0;
        end else begin
            if (en) begin
                if (data_out == data_a << data_b) begin
                    fim <= 1'b1;
                end else
                if (data_out == 6'b000000) begin
                    data_out <= {2'b00, data_a};
                end else begin
                    data_out <= data_out << 1;
                end                
                
            end else begin 
                fim <= 1'b0;
            end
        end
    end
endmodule