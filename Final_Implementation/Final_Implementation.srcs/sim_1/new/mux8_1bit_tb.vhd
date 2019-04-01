library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_1bit_tb is
end mux8_1bit_tb;

architecture Test of mux8_1bit_tb is
-- define signals in testbench to map to inputs and outputs
signal in0 : STD_LOGIC;
signal in1 : STD_LOGIC;
signal in2 : STD_LOGIC;
signal in3 : STD_LOGIC;
signal in4 : STD_LOGIC;
signal in5 : STD_LOGIC;
signal in6 : STD_LOGIC;
signal in7 : STD_LOGIC;
signal s0 : STD_LOGIC;
signal s1 : STD_LOGIC;
signal s2 : STD_LOGIC;
signal Z : STD_LOGIC;

-- define the component to test
component mux8_1bit port(
    in0 : in STD_LOGIC;
    in1 : in STD_LOGIC;
    in2 : in STD_LOGIC;
    in3 : in STD_LOGIC;
    in4 : in STD_LOGIC;
    in5 : in STD_LOGIC;
    in6 : in STD_LOGIC;
    in7 : in STD_LOGIC;
    s0 : in STD_LOGIC;
    s1 : in STD_LOGIC;
    s2 : in STD_LOGIC;
    Z : out STD_LOGIC);
end component;

-- define a clock period long enough for the mux to run
constant clk_period: Time := 2 ns;

begin
-- instansiate the unit under test
uut : mux8_1bit port map(
    in0 => in0,
    in1 => in1,
    in2 => in2,
    in3 => in3,
    in4 => in4,
    in5 => in5,
    in6 => in6,
    in7 => in7,
    s0 => s0,
    s1 => s1,
    s2 => s2,
    Z => Z);
    
-- begin process
stim_proc : process
begin
in0 <= '0';
in1 <= '1';
in2 <= '1';
in3 <= '1';
in4 <= '0';
in5 <= '0';
in6 <= '1';
in7 <= '1';
-- outputs should be undefined at this point
-- keep in0 to in7 constant and test the change in Z against s0, s1 and s2

wait for clk_period;
s0 <= '0';
s1 <= '0';
s2 <= '0';
-- Z = in0 = 0x0000

wait for clk_period;
s0 <= '0';
s1 <= '0';
s2 <= '1';
-- Z = in1 = 0x1111

wait for clk_period;
s0 <= '0';
s1 <= '1';
s2 <= '0';
-- Z = in2 = 0x2222

wait for clk_period;
s0 <= '0';
s1 <= '1';
s2 <= '1';
-- Z = in3 = 0x3333

wait for clk_period;
s0 <= '1';
s1 <= '0';
s2 <= '0';
-- Z = in4 = 0x4444

wait for clk_period;
s0 <= '1';
s1 <= '0';
s2 <= '1';
-- Z = in5 = 0x5555

wait for clk_period;
s0 <= '1';
s1 <= '1';
s2 <= '0';
-- Z = in6 = 0x6666

wait for clk_period;
s0 <= '1';
s1 <= '1';
s2 <= '1';
-- Z = in7 = 0x7777

end process;
end Test;