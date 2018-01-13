module pong(clock_50MHz, KEY, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, LCD_D, LCD_EN, LCD_RS, LCD_RW);

	input clock_50MHz;
	input [11:0] KEY;
	
	output VGA_HS;
	output VGA_VS;
	output [3:0] VGA_R;
	output [3:0] VGA_G;
	output [3:0] VGA_B;
	output [7:0] LCD_D;
	output LCD_EN;
	output LCD_RS;
	output LCD_RW;
	
	wire [9:0] x1;
	wire [9:0] y1;
	
	wire [9:0] x2;
	wire [9:0] y2;
	
	wire [9:0] xb;
	wire [9:0] yb;
	
	
	vgaDriver vgaDriver(
		.clock_50MHz(clock_50MHz),
		.rst(KEY[0]),
		.VGA_HS(VGA_HS),
		.VGA_VS(VGA_VS),
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.x1(x1),
		.y1(y1),
		.x2(x2),
		.y2(y2),
		.xb(xb),
		.yb(yb)
	);
	
	
	nios nios (
		.bx_export     (xb),     //      bx.export
		.by_export     (yb),     //      by.export
		.clk_clk       (clock_50MHz),       //     clk.clk
		.lcd_out_rs    (LCD_RS),    // lcd_out.rs
		.lcd_out_rw    (LCD_RW),    //        .rw
		.lcd_out_en    (LCD_EN),    //        .en
		.lcd_out_db    (LCD_D),    //        .db
		.p1x_export    (x1),    //     p1x.export
		.p1y_export    (y1),    //     p1y.export
		.p2x_export    (x2),    //     p2x.export
		.p2y_export    (y2),    //     p2y.export
		.reset_reset_n (~KEY[0]), //   reset.reset_n
		.start_export  (KEY[11])   //   start.export
	);
	

endmodule