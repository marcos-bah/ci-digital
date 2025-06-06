module mealy_compl2_tb;

reg clk;
reg rst;
reg in;
wire out;

mealy_compl2 uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

reg [7:0] input_data;
reg [7:0] output_data;
integer i;

initial begin
    input_data = 8'b0011_0110;
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1; #10;
    rst = 0;

    for (i = 0; i < 8; i = i + 1) begin
        in = input_data[i];
        #10;
        output_data[i] = out;
    end

    #20;
    $display("\nInput  = %b", input_data);
    $display("Output = %b", output_data);
    $finish;
end

endmodule