library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_fill_3to16 is
    Port ( in_3bits : in STD_LOGIC_VECTOR(2 downto 0);
           out_16bits : out STD_LOGIC_VECTOR(15 downto 0));
end zero_fill_3to16;

architecture Behavioral of zero_fill_3to16 is
constant delay: Time := 1 ns;
begin
out_16bits(0) <= in_3bits(0) after delay;
out_16bits(1) <= in_3bits(1) after delay;
out_16bits(2) <= in_3bits(2) after delay;
out_16bits(15 downto 3) <= "0000000000000" after delay;
end Behavioral;
