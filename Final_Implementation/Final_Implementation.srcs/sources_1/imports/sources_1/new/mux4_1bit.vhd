library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1bit is
    Port ( s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           in3 : in STD_LOGIC;
           out0 : out STD_LOGIC);
end mux4_1bit;

architecture Behavioral of mux4_1bit is
constant delay: Time := 1 ns;
begin
out0 <= in0 after delay when s0='0' and s1='0'
else in1 after delay when s0 ='0' and s1='1'
else in2 after delay when s0='1' and s1='0'
else in3 after delay when s0='1' and s1='1'
else '0' after delay;
end Behavioral;
