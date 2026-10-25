library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity prescaler is
	port(
		clock: in std_logic;
		reset: in std_logic;
		second_tick: out std_logic;
		ms_tick: out std_logic --aprox to 1ms, the 17 bit of the prescaler is used as signal
	);
end entity;

architecture rtl of prescaler is
	-- constants
	constant SECOND_COUNT: integer := 100_000_000;
	constant MS_COUNT: integer := 100_000;
	-- signals
	signal counter: unsigned(26 downto 0) := (others => '0');

begin
	process(clock, reset)
	begin
		if reset = '0' then
			counter <= (others => '0');
		elsif rising_edge(clock) then
			if counter =  SECOND_COUNT - 1 then
				counter <= (others => '0');
				second_tick <= '1';
			else
				counter <= counter + 1;
				second_tick <= '0';
			end if;
		end if;
	end process;
	
	ms_tick <= counter(17);
	
end architecture;