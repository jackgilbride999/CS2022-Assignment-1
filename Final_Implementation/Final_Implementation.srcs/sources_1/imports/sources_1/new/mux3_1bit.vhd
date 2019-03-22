library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux3_1bit is
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           s : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end mux3_1bit;

architecture Behavioral of mux3_1bit is
constant delay: Time := 1 ns;
begin
z <= in0 after delay when s="00" else
     in1 after delay when s="01" else
     in2 after delay when s="10" else
     '0' after delay;
end Behavioral;
