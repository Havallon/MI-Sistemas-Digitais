	component nios is
		port (
			clk_clk       : in  std_logic                    := 'X'; -- clk
			reset_reset_n : in  std_logic                    := 'X'; -- reset_n
			led_export    : out std_logic_vector(7 downto 0);        -- export
			rs232_rxd     : in  std_logic                    := 'X'; -- rxd
			rs232_txd     : out std_logic                            -- txd
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, -- reset.reset_n
			led_export    => CONNECTED_TO_led_export,    --   led.export
			rs232_rxd     => CONNECTED_TO_rs232_rxd,     -- rs232.rxd
			rs232_txd     => CONNECTED_TO_rs232_txd      --      .txd
		);
