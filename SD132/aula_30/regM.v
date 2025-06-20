module regM (
    input [3:0] divisor,
    input load, clk, rst,
    output reg [3:0] saida
);

always @(posedge clk, posedge rst) begin
    if (rst) begin
        saida <= 0;
    end else if (load) begin
        saida <= divisor;
    end 
end
    
endmodule