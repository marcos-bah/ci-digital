module grey_cell(input Gk, Pk, Gj, output Gout);
    assign Gout = Gk | (Pk & Gj);
endmodule