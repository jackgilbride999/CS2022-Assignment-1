library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_circuit_bitslice_tb is
end logic_circuit_bitslice_tb;

architecture Test of logic_circuit_bitslice_tb is
-- define signals in testbench to map to inputs and outputs
signal s0 : STD_LOGIC;
signal s1 : STD_LOGIC;
signal Ai : STD_LOGIC;
signal Bi : STD_LOGIC;
signal Gi : STD_LOGIC;

-- define the component to test
component logic_circuit_bitslice port(
    s0 : in STD_LOGIC;
    s1 : in STD_LOGIC;
    Ai : in STD_LOGIC;
    Bi : in STD_LOGIC;
    Gi : out STD_LOGIC);
end component;

-- define a clock period long enough for the bitslice to run
constant clk_period: Time := 5 ns;

begin
-- instansiate the unit under test
uut : logic_circuit_bitslice port map(
    s0 => s0,
    s1 => s1,
    Ai => Ai,
    Bi => Bi,
    Gi => Gi);
    
-- begin process
stim_proc : process
begin

wait for clk_period;
Ai <= '0';
Bi <= '0';
s0 <= '0';
s1 <= '0';
-- Gi = 0 AND 0 = 0

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- Gi = 0 OR 0 = 0

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- Gi = 0 XOR 0 = 0

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- Gi = NOT 0 = 1

wait for clk_period;
Ai <= '0';
Bi <= '1';
s0 <= '0';
s1 <= '0';
-- Gi = 0 AND 1 = 0

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- Gi = 0 OR 1 = 1

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- Gi = 0 XOR 1 = 1

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- Gi = NOT 0 = 1

wait for clk_period;
Ai <= '1';
Bi <= '0';
s0 <= '0';
s1 <= '0';
-- Gi = 1 AND 0 = 0

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- Gi = 1 OR 0 = 1

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- Gi = 1 XOR 0 = 1

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- Gi = NOT 1 = 0

wait for clk_period;
Ai <= '1';
Bi <= '1';
s0 <= '0';
s1 <= '0';
-- Gi = 1 AND 1 = 1

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- Gi = 1 OR 1 = 1

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- Gi = 1 XOR 1 = 0

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- Gi = NOT 1 = 0
end process;
end Test;