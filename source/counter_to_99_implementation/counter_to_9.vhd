library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_to_9 is
	port (
		clock: in std_logic;
		reset: in std_logic;
		enable: in std_logic;
		count: out unsigned(3 downto 0);
		carry: out std_logic
	);
end entity;

architecture rtl of counter_to_9 is

	signal counter: unsigned(3 downto 0) := (others => '0');
	
begin
	process(clock, reset)
	begin
		if reset = '0' then
			counter <= (others => '0');
		elsif rising_edge(clock) then
			if enable = '1' then
				if counter = 9 then
					counter <= (others => '0');
				else
					counter <= counter + 1;
				end if;
			end if;
		end if;
	end process;
	
	count <= counter;
	carry <= '1' when (counter = 9 and enable = '1') else '0';
	
end architecture;