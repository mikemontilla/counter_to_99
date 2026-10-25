library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seven_segment_decoder is
	port (
		digit: in unsigned(3 downto 0);
		segments: out std_logic_vector(6 downto 0)
	);
end entity;

architecture comb of seven_segment_decoder is
begin
	with digit select
		segments <= 	"1111110" when "0000",
						"0110000" when "0001",
						"1101101" when "0010",
						"1111001" when "0011",
						"0110011" when "0100",
						"1011011" when "0101",
						"1011111" when "0110",
						"1110000" when "0111",
						"1111111" when "1000",
						"1111011" when "1001",
						"1001111" when others;
end architecture;