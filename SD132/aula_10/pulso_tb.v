module pulso_tb;
reg A;
wire B;

pulso DUT (.a(A), .b(B));

initial begin
    $display("\npulso_tb");
    A = 0;
    #5 A = 1;
    #10 $stop;
end
endmodule
