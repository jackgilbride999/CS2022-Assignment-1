library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity B_input_logic_tb is
end B_input_logic_tb;

architecture Test of B_input_logic_tb is
-- define signals in testbench to map to inputs and outputs
signal B : STD_LOGIC_VECTOR (15 downto 0);
signal s0 : STD_LOGIC;
signal s1 : STD_LOGIC;
signal Y : STD_LOGIC_VECTOR (15 downto 0);

-- define the component to tst
component B_input_logic port(
   B : in STD_LOGIC_VECTOR (15 downto 0);
   s0 : in STD_LOGIC;
   s1 : in STD_LOGIC;
   Y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- define a clock period long enough for the input logic to run
constant clk_period: Time := 5 ns;

begin
-- instansiate the unit under test
uut : B_input_logic port map(
   B => B,
   s0 => s0,
   s1 => s1,
   Y => Y); 
   
-- begin process
stim_proc : process
begin
B <= "1010101010101010";
-- this is the first test signal

wait for clk_period;
s0 <= '0';
s1 <= '0';
-- Y = all 0s

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- Y = B = 1010101010101010

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- Y = !B = 0101010101010101

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- Y = all 1s
end process;

end Test;