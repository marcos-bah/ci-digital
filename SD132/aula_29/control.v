module control(
	input  clk, rst, start,
	input [4:0] A,
	input [2:0] count,
	output reg load, hab_A, shift, set_Q0, op
);

reg [2:0] state;
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6;

always @(posedge clk, posedge rst) begin
	if (rst) begin
    	state <= S0;
    	{load, hab_A, shift, set_Q0, op} <= 5'b00000;
	end else begin
    	case (state)
			S0: begin
				// ocioso (idle): espera o sinal de start
				if (start)
					state <= S1;
				else
					state <= S0;
			end

			S1: begin
				// carregamento (load)
				state <= S2;
			end

			S2: begin
				// deslocamento (shift)
				state <= S3;
			end

			S3: begin
				// subtração
				state <= S4;
			end

			S4: begin
				// comparação
				if (A[4]) begin
					state <= S5;
				end else if (count < 4 && !A[4]) begin
					state <= S2;
				end else if (count == 4 && !A[4]) begin
					state <= S0;
				end
			end

			S5: begin
				// restauração
				if (count < 4) begin
					state <= S2;
				end else if (count == 4) begin
					state <= S0;
				end
			end

			default: begin
				// padrão: volta para o estado inicial
				state <= S0;
			end
		endcase

	end
end

always @(*) begin
	case (state)
    	S0: begin //idle
			{load, hab_A, shift, set_Q0, op} <= 5'b00000;
    	end
    	S1: begin //carrega
			{load, hab_A, shift, set_Q0, op} <= 5'b10000;
    	end
    	S2: begin //desloca
			{load, hab_A, shift, set_Q0, op} <= 5'b00100;
    	end
    	S3: begin //subtrai
			{load, hab_A, shift, set_Q0, op} <= 5'b01000;
    	end
		S4: begin //compara
			set_Q0 <= !A[4];
			{load, hab_A, shift, op} <= 4'b0000;
    	end
		S5: begin //restaura
			{load, hab_A, shift, set_Q0, op} <= 5'b01001;
    	end
	endcase
end

endmodule