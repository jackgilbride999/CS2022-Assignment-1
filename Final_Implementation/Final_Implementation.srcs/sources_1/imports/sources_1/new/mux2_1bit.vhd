library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1bit is
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           s : in STD_LOGIC;
           Z : out STD_LOGIC);
end mux2_1bit;

architecture Behavioral of mux2_1bit is
constant delay: Time := 1 ns;
begin
Z <=in0 after delay when s='0'
else in1 after delay when s='1'
else '0' after delay;
end Behavioral;
