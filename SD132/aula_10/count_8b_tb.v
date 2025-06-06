module count_8b_tb;

reg clk;
reg rst;
wire [7:0] out;

count_8b uut (
    .clk(clk),
    .rst(rst),
    .out(out)
);

initial begin
    $display("\nTestbench para count_8b - Contador de 8 bits com reset assíncrono");
    
    clk = 0;
    rst = 1;
    
    #5 rst = 1;
    #10 rst = 0;
    
    #(256*10); 
    
    rst = 1;
    #10 rst = 0;
    
    #(20*10);
    
    $finish;
end

always #5 clk = ~clk;

endmodule
