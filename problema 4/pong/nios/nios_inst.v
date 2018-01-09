	nios u0 (
		.clk_clk       (<connected-to-clk_clk>),       //     clk.clk
		.reset_reset_n (<connected-to-reset_reset_n>), //   reset.reset_n
		.lcd_out_rs    (<connected-to-lcd_out_rs>),    // lcd_out.rs
		.lcd_out_rw    (<connected-to-lcd_out_rw>),    //        .rw
		.lcd_out_en    (<connected-to-lcd_out_en>),    //        .en
		.lcd_out_db    (<connected-to-lcd_out_db>),    //        .db
		.start_export  (<connected-to-start_export>),  //   start.export
		.p1x_export    (<connected-to-p1x_export>),    //     p1x.export
		.p1y_export    (<connected-to-p1y_export>),    //     p1y.export
		.p2x_export    (<connected-to-p2x_export>),    //     p2x.export
		.p2y_export    (<connected-to-p2y_export>),    //     p2y.export
		.bx_export     (<connected-to-bx_export>),     //      bx.export
		.by_export     (<connected-to-by_export>)      //      by.export
	);

