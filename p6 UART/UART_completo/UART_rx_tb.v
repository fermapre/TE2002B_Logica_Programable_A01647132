module UART_rx_tb ();

    reg clk;
    reg rst;
    reg rx_in;
    wire [7:0] data_out;
    wire data_ready;

    UART_Rx uut (
        .clk(clk),
        .rst(rst),
        .rx_in(rx_in),
        .data_out(data_out),
        .data_ready(data_ready)
    );

    initial begin 
        clk = 0;
        rst = 0;
        rx_in = 1; 
    end

    always 
        #10 clk = ~clk; 

    initial begin
        $display("simulacion iniciada");
        #30 rst = 1; // Resetear el módulo
        #10 rst = 0; // Liberar el reset
        #20;

        // Simular la recepción de datos (ejemplo con un byte específico)
        reg [7:0] test_data = 8'hA5; // Dato de prueba
        integer i;

        // Enviar bit de inicio
        rx_in = 0;
        #104167; // Esperar un período de bit (1/BAUD_RATE)

        // Enviar bits de datos
        for (i = 0; i < 8; i = i + 1) begin
            rx_in = test_data[i];
            #104167; // Esperar un período de bit
        end

        // Enviar bit de parada
        rx_in = 1;
        #104167; // Esperar un período de bit

        wait (data_ready); // Esperar a que los datos estén listos
        $display("Dato recibido: %h", data_out);
        
        $stop;
        $finish;
    end

    initial begin
        $dumpfile("UART_rx_tb.vcd");
        $dumpvars(0, UART_rx_tb);
    end
endmodule