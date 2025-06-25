module rom_8x256_tb;

    reg [7:0] addr;
    wire [7:0] data;

    rom_8x256 uut (
        .addr(addr),
        .data(data)
    );

    initial begin
        $display("\nTestbench da ROM 8x256");

        addr = 8'd0; #10;
        $display("addr = %0d, data = %h (esperado: AA)", addr, data);

        addr = 8'd1; #10;
        $display("addr = %0d, data = %h (esperado: BB)", addr, data);

        addr = 8'd2; #10;
        $display("addr = %0d, data = %h (esperado: CC)", addr, data);

        addr = 8'd3; #10;
        $display("addr = %0d, data = %h (esperado: 00)", addr, data);

        addr = 8'd255; #10;
        $display("addr = %0d, data = %h (esperado: 00)", addr, data);

        $finish;
    end

endmodule
