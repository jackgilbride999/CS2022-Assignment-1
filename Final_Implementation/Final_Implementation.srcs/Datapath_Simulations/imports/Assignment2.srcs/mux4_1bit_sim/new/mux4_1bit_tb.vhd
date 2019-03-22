library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1bit_tb is
end mux4_1bit_tb;

architecture Test of mux4_1bit_tb is
-- define signals in testbench to map to inputs and outputs
signal in0 : STD_LOGIC;
signal in1 : STD_LOGIC;
signal in2 : STD_LOGIC;
signal in3 : STD_LOGIC;
signal s0 : STD_LOGIC;
signal s1 : STD_LOGIC;
signal out0 : STD_LOGIC;

-- define the component to test
component mux4_1bit port(
    in0 : in STD_LOGIC;
    in1 : in STD_LOGIC;
    in2 : in STD_LOGIC;
    in3 : in STD_LOGIC;
    s0 : in STD_LOGIC;
    s1 : in STD_LOGIC;
    out0 : out STD_LOGIC);
end component;

-- define a clock period long enough for the mux to run
constant clk_period: Time := 2 ns;

begin
-- instansiate the unit under test
uut : mux4_1bit port map(
    in0 => in0,
    in1 => in1,
    in2 => in2,
    in3 => in3,
    s0 => s0,
    s1 => s1,
    out0 => out0);
    
-- begin process
stim_proc : process
begin
in0 <= '0';
in1 <= '1';
in2 <= '0';
in3 <= '1';
-- outputs should be undefined at this point
-- keep in0 and in1 constant and test the change in out0 against s

wait for clk_period;
s0 <= '0';
s1 <= '0';
-- out0 = in0 = low

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- out0 = in1 = high

wait for clk_period;
-- no change, out0 = in1 = high

wait for clk_period;
s0 <= '0';
s1 <= '0';
-- out0 = in0 = low

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- out0 = in1 = high

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- out0 = in2 = low

wait for clk_period;
-- no change, out0 = in2 = low

wait for clk_period;
in2 <= '1';
-- keep s the same but change in2 to show that out0=in2 and not any other inputs

wait for clk_period;
-- no change, out0 = in2 = high

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- out = in3 = high

wait for clk_period;
-- no change, out0 = in3 = high

wait for clk_period;
in3 <= '0';
-- keep s the same but change in3 to show that out0=in3 and not any other inputs

wait for clk_period;
-- no change, out0 = in3 = high
end process;
end Test;