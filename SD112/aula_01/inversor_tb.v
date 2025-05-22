module inversor_tb();

reg A; // estímulo de entrada
wire B; // monitoramento da saída

// instância do módulo sob teste
inversor dut (.a(A), .b(B));

initial 
    begin
    A = 0;
    //#1 A = ~A;
    //#1 A = ~A;
    end

always #1 A = ~A;

initial #10 $stop;

endmodule