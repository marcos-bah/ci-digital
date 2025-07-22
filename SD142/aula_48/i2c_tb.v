module i2c_tb;

    reg clk, reset, start, rw, ack_master;
    reg [7:0] master_data_in;
    reg [6:0] slave_address;
    wire [7:0] master_data_out, slave_data_out;
    wire master_done, slave_data_ready, slave_ack_error, slave_start;
    
    tri1 scl;
    tri1 sda;
    
    reg scl_drv, sda_drv;
    reg scl_out, sda_out;

    assign scl = scl_drv ? scl_out : 1'bz;
    assign sda = sda_drv ? sda_out : 1'bz;

    i2c dut (
        .clk(clk),
        .reset(reset),
        .master_start(start),
        .slave_address(slave_address),
        .master_rw(rw),
        .master_data_in(master_data_in),
        .slave_data_in(8'hA5),
        .master_ack(ack_master),
        .master_data_out(master_data_out),
        .slave_data_out(slave_data_out),
        .master_done(master_done),
        .slave_data_ready(slave_data_ready),
        .slave_ack_error(slave_ack_error),
        .slave_start(slave_start),
        .scl(scl),
        .sda(sda)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("\n==== Testbench Módulo Topo I2C (Controle Manual SDA/SCL) ====\n");

        clk = 0;
        reset = 1;
        start = 0;
        ack_master = 0;
        rw = 0;
        scl_drv = 0;
        sda_drv = 0;
        sda_out = 1;
        scl_out = 1;
        slave_address = 7'b1010101;
        master_data_in = 8'h3C;

        #20 reset = 0;
        #20;

        $display("\nInicio da Escrita pelo Mestre\n");
        @(negedge clk);
        start = 1;
        @(negedge clk);
        start = 0;

        wait(master_done);

        $display("\nMaster DONE: %b", master_done);
        $display("Dado recebido no escravo: %h", slave_data_out);
        $display("Esperado: %h", master_data_in);

        if (slave_data_out === master_data_in)
            $display("\nPASS: Escrita\n");
        else
            $display("\nFAIL: Escrita\n");

        #100;

        $display("\nInicio da Leitura pelo Mestre\n");

        rw = 1;
        ack_master = 1;
        master_data_in = 8'h00;
        @(negedge clk);
        start = 1;
        @(negedge clk);
        start = 0;

        wait(master_done);

        $display("\nMaster DONE: %b", master_done);
        $display("Dado recebido pelo mestre: %h", master_data_out);
        $display("Esperado: %h", 8'hA5);

        if (master_data_out === 8'hA5)
            $display("\nPASS: Leitura\n");
        else
            $display("\nFAIL: Leitura\n");

        #100 $finish;
    end

endmodule