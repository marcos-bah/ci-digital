module paridade_par #(
    parameter DATA_WIDTH = 8
)(
    input wire [DATA_WIDTH-1:0] data_in, 
    output bit_paridade
);
    assign bit_paridade = ^data_in; 
endmodule
