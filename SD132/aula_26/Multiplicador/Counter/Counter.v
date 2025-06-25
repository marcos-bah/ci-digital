module Counter #(parameter DATA_LENGTH = 4) (
    input Load, Clk, rst,
    output reg K
);

reg [DATA_LENGTH/2:0] count;

always @(posedge Clk, posedge rst) begin
    if (Load | rst) begin
        count <= 0;
        K <= 0;
    end else if (count == ((DATA_LENGTH * 2) - 2)) begin
        count <= 0;
        K <= 1;
    end else begin
        count <= count + 1;
        K <= 0;
    end
end

endmodule