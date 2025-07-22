    task load_pgm_1(input [1023:0] filename);
    integer fd, c, count;
    integer header_count;
    reg [7:0] dummy;
    begin
        fd = $fopen(filename, "rb");
        if (!fd) begin
        $display("Erro ao abrir %s", filename);
        $finish;
        end
        // Pula exatamente 3 linhas do cabecalho
        header_count = 0;
        while (header_count < 3 && !$feof(fd)) begin
        dummy = $fgetc(fd);
        if (dummy == "\n") header_count = header_count + 1;
        end
        for (count = 0; count < 14400; count = count + 1)
        pixel[count] = $fgetc(fd);
        $fclose(fd);
    end
    endtask
    //Como utilizar a task load_pagn_1
    //Passe o caminho completo onde voce colocou as imagens
    load_pgm_1("Caminho_completo_onde_esta_a_imagem/1.pgm");
    $display("Openning image");
