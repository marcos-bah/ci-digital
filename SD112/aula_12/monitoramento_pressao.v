module monitoramento_pressao #(parameter N = 8, LIMITE_BAIXO = 8'd50, LIMITE_ALTO = 8'd150) (
    input [N-1:0] pressao,
    output reg [1:0] alerta
);

    always @ (*) begin
    if (pressao < LIMITE_BAIXO) 
        alerta = 2'b00;
    else if (pressao > LIMITE_ALTO) 
            alerta = 2'b10;
        else
            alerta = 2'b01;
    end
    
endmodule