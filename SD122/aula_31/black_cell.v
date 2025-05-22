module black_cell(input Gk, Pk, Gj, Pj, output Gout, Pout);
    assign Gout = Gk | (Pk & Gj);
    assign Pout = Pk & Pj;
endmodule