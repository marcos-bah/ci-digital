module spi #(
    parameter integer CLK_FREQ = 50000000,  // Frequencia do clock do sistema (em Hz)
    parameter integer SCLK_FREQ = 1000000   // Frequencia desejada do clock SPI (em Hz)
)(
    input wire clk,                // Clock do sistema
    input wire reset,              // Reset do sistema
    input wire [7:0] data_in,      // Dados a serem enviados
    input wire start,              // Sinal para iniciar a transmissao
    input wire CPOL,               // Polaridade do clock (Clock Polarity)
    input wire CPHA,               // Fase do clock (Clock Phase)
    output SCLK,               // Clock SPI
    output [7:0] data_out,     // Dados recebidos do escravo
    output reg busy                // Indica que a transmissao esta em progresso
);

wire w_cs_slave;
wire [7:0] w_out;
wire MISO, MOSI, w_MISO;
wire busy_master, busy_slave_01, busy_slave_02;

always @(*) begin
    busy = busy_master | busy_slave_01 | busy_slave_02;
end

spi_master #(
    .CLK_FREQ(CLK_FREQ), 
    .SCLK_FREQ(SCLK_FREQ)
) uut_master (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .start(start),
    .CPOL(CPOL),
    .CPHA(CPHA),
    .MISO(MISO),
    .SCLK(SCLK),
    .MOSI(MOSI),
    .CS(w_cs_slave),
    .busy(busy_master),
    .data_out(w_out)
);

spi_slave uut_slave_01 (
    .clk(clk),
    .reset(reset),
    .data_in(w_out),
    .CS(w_cs_slave),
    .CPOL(CPOL),
    .CPHA(CPHA),
    .SCLK(SCLK),
    .MOSI(MOSI),
    .MISO(w_MISO),
    .busy(busy_slave_01),
    .data_out(data_out)
);   

spi_slave uut_slave_02 (
    .clk(clk),
    .reset(reset),
    .data_in(w_out),
    .CS(w_cs_slave),
    .CPOL(CPOL),
    .CPHA(CPHA),
    .SCLK(SCLK),
    .MOSI(w_MOSI),
    .MISO(MISO),
    .busy(busy_slave_02),
    .data_out(data_out)
);
endmodule