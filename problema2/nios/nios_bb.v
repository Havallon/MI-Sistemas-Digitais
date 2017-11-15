
module nios (
	chave_external_connection_export,
	clk_clk,
	dezena_external_connection_export,
	reset_reset_n,
	start_external_connection_export,
	unidade_external_connection_export);	

	input	[3:0]	chave_external_connection_export;
	input		clk_clk;
	output	[7:0]	dezena_external_connection_export;
	input		reset_reset_n;
	input		start_external_connection_export;
	output	[7:0]	unidade_external_connection_export;
endmodule
