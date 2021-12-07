	component nios_system is
		port (
			clk_clk       : in  std_logic                     := 'X';             -- clk
			key_export    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- export
			ledg_export   : out std_logic_vector(8 downto 0);                     -- export
			ledr_export   : out std_logic_vector(17 downto 0);                    -- export
			reset_reset_n : in  std_logic                     := 'X';             -- reset_n
			switch_export : out std_logic_vector(7 downto 0)                      -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --    clk.clk
			key_export    => CONNECTED_TO_key_export,    --    key.export
			ledg_export   => CONNECTED_TO_ledg_export,   --   ledg.export
			ledr_export   => CONNECTED_TO_ledr_export,   --   ledr.export
			reset_reset_n => CONNECTED_TO_reset_reset_n, --  reset.reset_n
			switch_export => CONNECTED_TO_switch_export  -- switch.export
		);

