/*
María Fernanda Martínez Presa - A01647132
Practica 1 Números primos | feb 13 2026
*/

module primos_tb();
    reg [3:0] primo;
    wire y, no_primo;

    primos dut(.primo(primo), .y(y), .no_primo(no_primo));
    initial begin
        $display("simulacion iniciada");
        primo = 0;

        // números primos
        primo = 4'b0010; #10; // #2
        primo = 4'b0011; #10; // #3
        primo = 4'b0101; #10; // #5
        primo = 4'b0111; #10; // #7
        primo = 4'b1011; #10; // #11
        primo = 4'b1101; #10; // #13

        // números no primos
        primo = 4'b0000; #10; // #0
        primo = 4'b0001; #10; // #1
        primo = 4'b0100; #10; // #4
        primo = 4'b0110; #10; // #6
        primo = 4'b1000; #10; // #8
        primo = 4'b1001; #10; // #9
        primo = 4'b1010; #10; // #10
        primo = 4'b1100; #10; // #12
        primo = 4'b1110; #10; // #14
        primo = 4'b1111; #10; // #15


        $display("simulacion terminada");
        $stop;
        $finish;
    end

    initial begin
        $monitor("primo=%b y=%b", primo, y);
    end

    initial begin
        $dumpfile("primos.vcd");
        $dumpvars(0, primos_tb);
    end
endmodule