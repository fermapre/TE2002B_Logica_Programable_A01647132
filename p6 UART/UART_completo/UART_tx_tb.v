`include "UART_tx.v"
module UART_tx_tb;

    reg clk;
    reg rst;
    reg [7:0] data_in;
    reg start;
    wire tx_out;
    wire busy;

    UART_tx uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .start(start),
        .tx_out(tx_out),
        .busy(busy)
    );

    always #10 clk = ~clk; // generar el reloj de 50MHz

    initial begin 
        clk = 0;
        rst = 0;
        data_in = 8'h00;
        start = 0;

        $display("simulacion iniciada");
        #30 rst = 0; // Resetear el módulo
        #20 rst = 1; // Liberar el reset
        #20 rst = 0; // Liberar el reset
        #40;

        repeat (5) begin
            @(negedge clk);      // Esperamos al flanco de bajada para cambiar datos
            data_in = $random % 256;
            start = 1;
            
            @(negedge clk);      // Mantener start un ciclo
            start = 0;

            // 3. El truco clave: esperar a que el módulo reconozca el trabajo
            wait (busy == 1);    // Esperar a que empiece
            $display("Transmitiendo dato: %h", data_in);
            wait (busy == 0);    // Esperar a que termine
            
            #100;                // Un pequeño espacio entre bytes
        end

        $display("Simulacion finalizada con exito");
        $stop;
    end

    initial begin
        $dumpfile("UART_tx_tb.vcd");
        $dumpvars(0, UART_tx_tb);
    end

endmodule