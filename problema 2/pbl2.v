module pbl2 (KEY, clock_50MHz, DISP1_D, DISP0_D, Switch);
	
	input [11:0] KEY;
	input clock_50MHz;
	input [3:0] Switch;

	
	output [7:0] DISP1_D;
	output [7:0] DISP0_D;
	
	
	 nios u0 (
        .chave_external_connection_export   (Switch),   //   chave_external_connection.export
        .clk_clk                            (clock_50MHz),                            //                         clk.clk
        .dezena_external_connection_export  (DISP1_D),  //  dezena_external_connection.export
        .reset_reset_n                      (~KEY[0]),                      //                       reset.reset_n
        .start_external_connection_export   (KEY[11]),   //   start_external_connection.export
        .unidade_external_connection_export (DISP0_D)  // unidade_external_connection.export
    );


endmodule