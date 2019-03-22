library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_circuit_16bits_tb is
end logic_circuit_16bits_tb;

architecture Test of logic_circuit_16bits_tb is
-- define signals in testbench to map to inputs and outputs
signal s0 : STD_LOGIC;
signal s1 : STD_LOGIC;
signal A : STD_LOGIC_VECTOR(15 downto 0);
signal B : STD_LOGIC_VECTOR(15 downto 0);
signal G : STD_LOGIC_VECTOR(15 downto 0);

-- define the component to test
component logic_circuit_16bits port(
    A : in STD_LOGIC_VECTOR(15 downto 0);
    B : in STD_LOGIC_VECTOR(15 downto 0);
    s0 : in STD_LOGIC;
    s1 : in STD_LOGIC;
    G : out STD_LOGIC_VECTOR(15 downto 0));
end component;

-- define a clock period long enough for the circuit to run
constant clk_period: Time := 5 ns;

begin
-- instansiate the unit under test
uut : logic_circuit_16bits port map(
    A => A,
    B => B,
    s0 => s0,
    s1 => s1,
    G => G);
    
-- begin process
stim_proc : process
begin

wait for clk_period;
A <= "0000000000000000";
B <= "0000000000000000";
s0 <= '0';
s1 <= '0';
-- G = 0x0000 AND 0x0000 = 0x0000

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- G = 0x0000 OR 0x0000 = 0x0000

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- Gi = 0x0000 XOR 0x0000 = 0

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- Gi = NOT 0x0000 = 0xFFFF

wait for clk_period;
A <= "0000000000000000";
B <= "1111111111111111";
s0 <= '0';
s1 <= '0';
-- Gi = 0x0000 AND 0xFFFF = 0X0000

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- Gi = 0x0000 OR 0XFFFF = 0XFFFF

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- Gi = 0x0000 XOR 0xFFFF = 0XFFFF

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- Gi = NOT 0x0000 = 0xFFFF

wait for clk_period;
A <= "1111111111111111";
B <= "0000000000000000";
s0 <= '0';
s1 <= '0';
-- Gi = 0xFFFF AND 0x0000 = 0x0000

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- Gi = 0xFFFF OR 0x0000 = 0xFFFF

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- Gi = 0xFFFF XOR 0x0000 = 0xFFFF

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- Gi = NOT 0xFFFF = 0x0000

wait for clk_period;
A <= "1111111111111111";
B <= "1111111111111111";
s0 <= '0';
s1 <= '0';
-- Gi = 0xFFFF AND 0xFFFF = 0xFFFF

wait for clk_period;
s0 <= '0';
s1 <= '1';
-- Gi = 0xFFFF OR 0xFFFF = 0xFFFF

wait for clk_period;
s0 <= '1';
s1 <= '0';
-- Gi = 0xFFFFF XOR 0xFFFF = 0x0000

wait for clk_period;
s0 <= '1';
s1 <= '1';
-- Gi = NOT 0xFFFF = 0x0000
end process;
end Test;