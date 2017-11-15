	component nios is
		port (
			chave_external_connection_export   : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			clk_clk                            : in  std_logic                    := 'X';             -- clk
			dezena_external_connection_export  : out std_logic_vector(7 downto 0);                    -- export
			reset_reset_n                      : in  std_logic                    := 'X';             -- reset_n
			start_external_connection_export   : in  std_logic                    := 'X';             -- export
			unidade_external_connection_export : out std_logic_vector(7 downto 0)                     -- export
		);
	end component nios;

	u0 : component nios
		port map (
			chave_external_connection_export   => CONNECTED_TO_chave_external_connection_export,   --   chave_external_connection.export
			clk_clk                            => CONNECTED_TO_clk_clk,                            --                         clk.clk
			dezena_external_connection_export  => CONNECTED_TO_dezena_external_connection_export,  --  dezena_external_connection.export
			reset_reset_n                      => CONNECTED_TO_reset_reset_n,                      --                       reset.reset_n
			start_external_connection_export   => CONNECTED_TO_start_external_connection_export,   --   start_external_connection.export
			unidade_external_connection_export => CONNECTED_TO_unidade_external_connection_export  -- unidade_external_connection.export
		);

