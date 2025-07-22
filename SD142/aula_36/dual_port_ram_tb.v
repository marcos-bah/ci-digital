module dual_port_ram_tb;

    reg clk, cs, we_a;
    reg [8:0] addr_a, addr_b;
    reg [7:0] data_in_a;
    wire [7:0] data_out_a, data_out_b;

    dual_port_ram uut (
        .clk(clk), .cs(cs),
        .we_a(we_a), .addr_a(addr_a),
        .data_in_a(data_in_a), .data_out_a(data_out_a),
        .addr_b(addr_b), .data_out_b(data_out_b)
    );

    initial begin
        $display("\nTestbench - dual_port_ram");

        clk = 0;
        cs = 0;
        we_a = 0;
        addr_a = 0;
        addr_b = 0;
        data_in_a = 0;

        #5 cs = 1;

        // Escrita em 4 endereços pela porta A
        we_a = 1;
        addr_a = 9'd100; data_in_a = 8'hAA; #10;
        addr_a = 9'd101; data_in_a = 8'hBB; #10;
        addr_a = 9'd102; data_in_a = 8'hCC; #10;
        addr_a = 9'd103; data_in_a = 8'hDD; #10;

        // Leitura simultânea nas portas A e B
        we_a = 0;
        addr_a = 9'd100;
        addr_b = 9'd101; #10;

        addr_a = 9'd102;
        addr_b = 9'd103; #10;

        $stop;
    end

    always #5 clk = ~clk;

endmodule
