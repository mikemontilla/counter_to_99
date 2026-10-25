library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity digit_selector is	port(
		digit_selection: in std_logic;
		units_digit: in unsigned(3 downto 0);
		tens_digit: in unsigned(3 downto 0);
		out_digit: out unsigned(3 downto 0)
	);
end entity;

architecture comb of digit_selector is
begin
	out_digit <= tens_digit when digit_selection = '1' else units_digit;
end architecture;