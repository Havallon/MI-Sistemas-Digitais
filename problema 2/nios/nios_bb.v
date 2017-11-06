
module nios (
	clk_clk,
	reset_reset_n,
	start_external_connection_export,
	chave_external_connection_export,
	unidade_external_connection_export,
	dezena_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	input		start_external_connection_export;
	input	[3:0]	chave_external_connection_export;
	output	[7:0]	unidade_external_connection_export;
	output	[7:0]	dezena_external_connection_export;
endmodule
