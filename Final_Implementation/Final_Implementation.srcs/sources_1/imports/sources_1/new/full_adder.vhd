library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder is
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
constant delay: Time := 1 ns;
-- SIGNALS
signal s1 : STD_LOGIC;
signal s2 : STD_LOGIC;
signal s3 : STD_LOGIC;
begin
s1 <= (in0 xor in1) after delay;
s2 <= (c_in and s1) after delay;
s3 <= (in0 and in1) after delay;
sum <= (s1 xor c_in) after delay;
c_out <= (s2 or s3) after delay;
end Behavioral;
