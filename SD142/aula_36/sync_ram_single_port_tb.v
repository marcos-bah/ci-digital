module sync_ram_single_port_tb;

    reg clk, cs, we;
    reg [8:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    sync_ram_single_port uut (
        .clk(clk), .cs(cs), .we(we),
        .addr(addr), .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        $display("\nTestbench - sync_ram_single_port");

        clk = 0;
        cs = 0;
        we = 0;
        addr = 0;
        data_in = 0;

        #5 cs = 1;

        // Escrita em 3 endereços
        we = 0;
        addr = 9'd10; data_in = 8'hA5; #10;
        addr = 9'd20; data_in = 8'h5A; #10;
        addr = 9'd30; data_in = 8'hFF; #10;

        // Leitura dos mesmos endereços
        we = 1;
        addr = 9'd10; #10;
        addr = 9'd20; #10;
        addr = 9'd30; #10;

        $stop;
    end

    always #5 clk = ~clk;

endmodule
