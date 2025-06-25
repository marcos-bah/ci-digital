module rom_8x256 (
    input wire [7:0] addr,  
    output reg [7:0] data  
);

    reg [7:0] rom [0:255];
    integer i;

    initial begin

        rom[0] = 8'hAA;
        rom[1] = 8'hBB;
        rom[2] = 8'hCC;
        
        for (i = 3; i < 256; i = i + 1) begin
            rom[i] = 8'h00;
        end
            
    end

    always @(*) begin
        data = rom[addr];
    end

endmodule
