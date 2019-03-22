library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3_1bit_tb is
end mux3_1bit_tb;

architecture Test of mux3_1bit_tb is
-- define signals in testbench to map to inputs and outputs
signal in0 : STD_LOGIC;
signal in1 : STD_LOGIC;
signal in2 : STD_LOGIC;
signal s : STD_LOGIC_VECTOR(1 downto 0);
signal Z : STD_LOGIC;

-- define the component to test
component mux3_1bit port(
    in0 : in STD_LOGIC;
    in1 : in STD_LOGIC;
    in2 : in STD_LOGIC;
    s : in STD_LOGIC_VECTOR(1 downto 0);
    Z : out STD_LOGIC);
end component;

-- define a clock period long enough for the mux to run
constant clk_period: Time := 2 ns;

begin
-- instansiate the unit under test
uut : mux3_1bit port map(
    in0 => in0,
    in1 => in1,
    in2 => in2,
    s => s,
    Z => Z);
    
-- begin process
stim_proc : process
begin
in0 <= '0';
in1 <= '1';
in2 <= '0';
-- outputs should be undefined at this point
-- keep in0 and in1 constant and test the change in Z against s

wait for clk_period;
s <= "00";
-- Z = in0 = low

wait for clk_period;
s <= "01";
-- Z = in1 = high

wait for clk_period;
-- no change, Z = in1 = high

wait for clk_period;
s <= "00";
-- Z = in0 = low

wait for clk_period;
s <= "01";
-- Z = in1 = high

wait for clk_period;
s <= "10";
-- Z = in2 = low

wait for clk_period;
-- no change, Z = in2 = low

wait for clk_period;
in2 <= '1';
-- keep s the same but change in2 to show that z=in2 and not in0 or in1

wait for clk_period;
-- no change, z = in2 = high
end process;
end Test;