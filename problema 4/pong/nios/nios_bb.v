
module nios (
	clk_clk,
	reset_reset_n,
	lcd_out_rs,
	lcd_out_rw,
	lcd_out_en,
	lcd_out_db,
	start_export,
	p1x_export,
	p1y_export,
	p2x_export,
	p2y_export,
	bx_export,
	by_export);	

	input		clk_clk;
	input		reset_reset_n;
	output		lcd_out_rs;
	output		lcd_out_rw;
	output		lcd_out_en;
	output	[7:0]	lcd_out_db;
	input		start_export;
	output	[9:0]	p1x_export;
	output	[9:0]	p1y_export;
	output	[9:0]	p2x_export;
	output	[9:0]	p2y_export;
	output	[9:0]	bx_export;
	output	[9:0]	by_export;
endmodule
