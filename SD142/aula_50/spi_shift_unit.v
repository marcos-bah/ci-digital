module spi_shift_unit (
    input  wire        clk,
    input  wire        reset,
    input  wire        SCLK,
    input  wire        CPOL,
    input  wire        CPHA,
    input  wire        edge_pos,
    input  wire        edge_neg,
    input  wire        shift_sample_data,
    input  wire        load_data,
    input  wire        load_data_out,
    input  wire [7:0]  data_in,
    input  wire        MOSI,

    output reg         MISO,
    output reg [7:0]   data_out,
    output reg [3:0]   bit_cnt
);

    reg sclk_last;
    reg sample, shift;
    reg [7:0] shift_reg;
    reg [7:0] rx_reg;

    // Sincronização de SCLK no clock do sistema
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sclk_last <= CPOL;
        end else begin
            sclk_last <= SCLK;
        end
    end

    // Geração dos sinais de amostragem e deslocamento
    always @(*) begin
        sample = (edge_pos && (CPOL == CPHA)) || (edge_neg && (CPOL != CPHA));
        shift  = (edge_neg && (CPOL == CPHA)) || (edge_pos && (CPOL != CPHA));
    end

    // Saída MISO no momento da amostragem
    always @(posedge sample or posedge reset) begin
        if (reset) begin
            MISO <= 1'b0;
        end else if (shift_sample_data) begin
            MISO <= shift_reg[7];
        end
    end

    // Contador de bits
    always @(posedge shift or posedge reset) begin
        if (reset) begin
            bit_cnt <= 4'b0;
        end else if (shift_sample_data) begin
            bit_cnt <= bit_cnt + 1'b1;
        end else begin
            bit_cnt <= 4'b0;
        end
    end

    // Registro de deslocamento (shift register)
    always @(posedge shift or posedge load_data or posedge reset) begin
        if (reset) begin
            shift_reg <= 8'b0;
            rx_reg <= 8'b0;
        end else if (load_data) begin
            shift_reg <= data_in;
        end else if (shift_sample_data) begin
            shift_reg <= {shift_reg[6:0], 1'b0};
            rx_reg    <= {rx_reg[6:0], MOSI};
        end
    end

    // Registro de saída após recepção
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= 8'b0;
        end else if (load_data_out) begin
            data_out <= rx_reg;
        end
    end

endmodule
