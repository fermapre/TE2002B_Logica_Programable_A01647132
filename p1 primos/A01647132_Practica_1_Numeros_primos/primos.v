/*
María Fernanda Martínez Presa - A01647132
Practica 1 Números primos
*/

module primos(
    input [3:0] primo,
    output reg y, no_primo
);

    always @(*) begin
        case(primo)
            4'b0010: y = 2;
            4'b0011: y = 3;
            4'b0101: y = 5;
            4'b0111: y = 7;
            4'b1011: y = 11;
            4'b1101: y = 13;

            default: no_primo = 0;
        endcase
    end

endmodule