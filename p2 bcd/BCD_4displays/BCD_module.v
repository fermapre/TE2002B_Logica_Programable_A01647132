module BCD_module(
    input [3:0] bcd_in,
    output reg[0:6] bcd_out
);

always @(*)
    begin
        case(bcd_in)
        4'b0000: bcd_out = ~7'b 1111_110; // 0 
        4'b0001: bcd_out = ~7'b 0110_000; // 1
        4'b0010: bcd_out = ~7'b 1101_110; // 2
        4'b0011: bcd_out = ~7'b 1111_001; // 3 
        4'b0100: bcd_out = ~7'b 0110_011; // 4
        4'b0101: bcd_out = ~7'b 1011_011; // 5
        4'b0110: bcd_out = ~7'b 1011_111; // 6
        4'b0111: bcd_out = ~7'b 1110_000; // 7
        4'b1000: bcd_out = ~7'b 1111_111; // 8
        4'b1001: bcd_out = ~7'b 1111_011; // 9
        endcase
    end

endmodule