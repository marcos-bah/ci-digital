module MulWTSK_tb();
    reg [3:0] A, B;
	wire [7:0] S;

	reg [7:0] expected;

	MulWTSK uut (
    	.A(A),
    	.B(B),
    	.S(S)
	);

	integer i, j, k;
	integer errors = 0;

	initial begin
    	for (i = 0; i < 16; i = i + 1) begin
        	for (j = 0; j < 16; j = j + 1) begin
                A = i[3:0];
                B = j[3:0];
                expected = A * B;
                #10;  // Aguarda propagação de sinais

                if (S !== expected) begin
                    $display("ERRO: A=%b, B=%b => Esperado: S=%b | Obtido: S=%b",
                            A, B, expected, S);
                    errors = errors + 1;
                end
        	end
    	end

    	if (errors == 0)
        	$display("Todos os testes passaram com sucesso.");
    	else
        	$display("Total de erros: %d", errors);

    	$finish;
	end
endmodule