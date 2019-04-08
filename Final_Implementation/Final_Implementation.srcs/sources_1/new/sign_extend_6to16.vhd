library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_extend_6to16 is
    Port ( in_6bits : in STD_LOGIC_VECTOR(5 downto 0);
           out_16bits : out STD_LOGIC_VECTOR(15 downto 0));
end sign_extend_6to16;

architecture Behavioral of sign_extend_6to16 is
constant delay: Time := 1 ns;
begin
out_16bits(5 downto 0) <= in_6bits after delay;
out_16bits(15 downto 6) <= "0000000000" after delay when in_6bits(5) = '0'
else "1111111111" after delay when in_6bits(5) = '1';
end Behavioral;
