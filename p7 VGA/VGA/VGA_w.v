// vga wrapper module, to be used in the top level design
// hacer que se muestren los pixeles en el monitor, usando el modulo VGADemo

module VGA_w (
    input MAX10_CLK1_50,
    output [2:0] pixel,
    output hsync_out,
    output vsync_out
);

VGADemo vga_demo (
    .MAX10_CLK1_50(MAX10_CLK1_50),
    .pixel(pixel),
    .hsync_out(hsync_out),
    .vsync_out(vsync_out)
);


// mostrar todos los colores en el monitor, usando el modulo VGADemo
    



endmodule