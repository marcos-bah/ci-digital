module contador_tb;

reg clk, rst;
reg [2:0] opcao;
wire [2:0] q;

contador #(.N(3), .a(0), .p(5)) dut (
    .clk(clk),
    .rst(rst),
    .opcao(opcao),
    .q(q)
);

initial begin
    $display("\nTestbench do contador com N bits e controle");
    clk = 0;
    forever #5 clk = ~clk;
end

task testa_opcao(input [2:0] op);
    integer i;
    begin
        rst = 1; opcao = op; #10;
        rst = 0;

        for (i = 0; i < 10; i = i + 1) begin
            #10;
        end
    end
endtask

initial begin
    testa_opcao(3'b000);
    testa_opcao(3'b001);
    testa_opcao(3'b010);
    testa_opcao(3'b011);
    testa_opcao(3'b100);
    testa_opcao(3'b101);
    testa_opcao(3'b110);

    $finish;
end

endmodule
