// Test bench
module multiplier_csa_tb;
    reg [3:0] multiplicand;
    reg [3:0] multiplier;
    wire [7:0] product;

    // Instancia do multiplicador
    multiplier_csa #(4) uut (
        .multiplicand ( multiplicand ),
        .multiplier ( multiplier ),
        .product ( product )
    );

    initial begin
        // Testar combinacoes de entradas
        multiplicand = 4'b0011 ; // 3
        multiplier = 4'b0101 ; // 5
        #10;

        $display (" Multiplicand : %d, Multiplier : %d, Product : %d", multiplicand , multiplier , product );

        multiplicand = 4'b1111 ; // 15
        multiplier = 4'b0001 ; // 1
        #10;

        $display (" Multiplicand : %d, Multiplier : %d, Product : %d", multiplicand , multiplier ,product );

        multiplicand = 4'b1011 ; // 11
        multiplier = 4'b1111 ; // 15
        #10;

        $display (" Multiplicand : %d, Multiplier : %d, Product : %d", multiplicand , multiplier ,product );

        multiplicand = 4'b1111 ; // 15
        multiplier = 4'b1111 ; // 15
        #10;

        $display (" Multiplicand : %d, Multiplier : %d, Product : %d", multiplicand , multiplier,product );

        $finish;
    end
endmodule