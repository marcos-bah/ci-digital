module single_port_ram (
    input wire clk, we, cs,
    input wire [9:0] addr,
    input wire [7:0] din,
    output wire [7:0] dout
);

    reg [7:0] mem [0:1023];
    reg [7:0] saida;

    assign dout = saida;

    always @(posedge clk) begin
        if (cs) begin
            if (we)
                mem[addr] <= din;
            saida <= mem[addr];
        end else begin
            saida <= 8'bz; 
        end
    end

endmodule
