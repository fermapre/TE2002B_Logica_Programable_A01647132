module BCD_module()
    reg bcd_in, 
    wire [0:6] bcd_out 

    BCD_module dut(.bcd_in(bcd_in), .bcd_out(bcd_out));

    initial
        begin 
            repeat(16)
            begin 
                bcd_in = $random%16; #10;
            end
        $stop;
        $finish;
    end 
    
initial 
    begin
        $monitor("bcd_in = %b D=%b bcd_out =%b", bcd_in, bcd_out);
    end

    initial 
    begin
        $dumpfile("BCD_module.vcd");
        $dumpvars(0, BCD_module_tb);
    end

endmodule