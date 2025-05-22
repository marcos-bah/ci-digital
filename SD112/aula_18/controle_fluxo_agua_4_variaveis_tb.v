module controle_fluxo_agua_4_variaveis_tb();
    reg A, B, C, D;
    wire S_mintermos, S_maxtermos;
    integer i = 0;
    initial begin
        for (i = 0; i < 16; i = i + 1) 
            #10 {A, B, C, D} = i;
        #10;
    end
    controle_fluxo_agua_4_variaveis DUT (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .S_mintermos(S_mintermos),
        .S_maxtermos(S_maxtermos)
    ); 
endmodule
