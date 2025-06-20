module control(
	input  clk, rst, start,
	input [4:0] A,
	input [2:0] count,
	output reg load, hab_A, shift, set_Q0, op
);

reg [2:0] state;
parameter idle = 0, carrega = 1, desloca = 2, soma = 3, subtrai = 4, compara = 5, restaura = 6;

always @(posedge clk, posedge rst) begin
	if (rst) begin
    	state <= idle;
    	{load, hab_A, shift, set_Q0, op} <= 5'b00000;
	end else begin
    	case (state)
			idle: begin
				// ocioso (idle): espera o sinal de start
				if (start)
					state <= carrega;
				else
					state <= idle;
			end

			carrega: begin
				// carregamento (load)
				state <= desloca;
			end

			desloca: begin
				// deslocamento (shift)
				if (A[4])
					state <= soma;
				else
					state <= subtrai;
			end

			soma: begin
				// subtração
				state <= compara;
			end

			subtrai: begin
				state <= compara;
			end

			compara: begin
				// restauração
				if (count < 4) begin
					state <= desloca;
				end else if (count == 4 && A[4]) begin
					state <= restaura;
				end else if (count == 4 && !A[4]) begin
					state <= idle;
				end
			end

			restaura: begin
				state <= idle;
			end

			default: begin
				// padrão: volta para o estado inicial
				state <= idle;
			end
		endcase

	end
end

always @(*) begin
	case (state)
    	idle: begin //idle
			{load, hab_A, shift, set_Q0, op} <= 5'b00000;
    	end
    	carrega: begin //carrega
			{load, hab_A, shift, set_Q0, op} <= 5'b10000;
    	end
    	desloca: begin //desloca
			{load, hab_A, shift, set_Q0, op} <= 5'b00100;
    	end
    	soma: begin //soma
			{load, hab_A, shift, set_Q0, op} <= 5'b01001;
    	end
		subtrai: begin //subtrai
			{load, hab_A, shift, set_Q0, op} <= 5'b01000;
    	end
		compara: begin //compara
			set_Q0 <= !A[4];
			{load, hab_A, shift, op} <= 4'b0000;
    	end
		restaura: begin //restaura
			{load, hab_A, shift, set_Q0, op} <= 5'b01001;
    	end
	endcase
end

endmodule