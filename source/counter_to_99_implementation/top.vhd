library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
	port(
		clock: in std_logic;
		reset: in std_logic;
		segments: out std_logic_vector(6 downto 0);
		digit_selection: out std_logic
	);
end entity;

architecture structural of top is

	--components from IPs
	component pll_100 is
		port(
            clki_i  : in  std_logic;
            rstn_i  : in  std_logic;
            clkop_o : out std_logic;
            lock_o  : out std_logic
        );
	end component;

	-- signals for connections
	signal clock_pll: std_logic;
	signal second_tick_s: std_logic;
	signal ms_tick_s: std_logic;
	signal carry_units_s: std_logic;
	signal units_digit_s: unsigned(3 downto 0);
	signal tens_digit_s: unsigned(3 downto 0);
	signal selected_digit_s: unsigned(3 downto 0);
	
begin
	pll: pll_100
	port map(
		clki_i => clock,
		rstn_i => '1',
		clkop_o => clock_pll,
		lock_o => open
	);
	
	prescaler: entity work.prescaler
	port map(
		clock => clock_pll,
		reset => reset,
		second_tick => second_tick_s,
		ms_tick => ms_tick_s
	);
	
	units_counter: entity work.counter_to_9
	port map(
		clock => clock_pll,
		reset => reset,
		enable => second_tick_s,
		count => units_digit_s,
		carry => carry_units_s
	);
	
	tens_counter: entity work.counter_to_9
	port map(
		clock => clock_pll,
		reset => reset,
		enable => carry_units_s,
		count => tens_digit_s,
		carry => open
	);
	
	digit_selector: entity work.digit_selector
	port map(
		digit_selection => ms_tick_s,
		units_digit => units_digit_s,
		tens_digit => tens_digit_s,
		out_digit => selected_digit_s
	);
	
	segments_decoder: entity work.seven_segment_decoder
	port map(
		digit => selected_digit_s,
		segments => segments
	);
	
	digit_selection <= ms_tick_s;
	
	
end architecture;