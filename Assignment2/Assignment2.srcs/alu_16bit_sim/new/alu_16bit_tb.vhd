library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_16bit_tb is
end alu_16bit_tb;

architecture Test of alu_16bit_tb is
-- define signals in testbench to map to inputs and outputs
signal A : STD_LOGIC_VECTOR (15 downto 0);
signal B : STD_LOGIC_VECTOR (15 downto 0);
signal s0 : STD_LOGIC;
signal s1 : STD_LOGIC;
signal s2 : STD_LOGIC;
signal c_in : STD_LOGIC;
signal c_out : STD_LOGIC;
signal G : STD_LOGIC_VECTOR (15 downto 0);
signal V : STD_LOGIC;

-- define the component to test
component alu_16bit port(
    A : in STD_LOGIC_VECTOR (15 downto 0);
    B : in STD_LOGIC_VECTOR (15 downto 0);
    s0 : in STD_LOGIC;
    s1 : in STD_LOGIC;
    s2 : in STD_LOGIC;
    c_in : in STD_LOGIC;
    c_out : out STD_LOGIC;
    G : out STD_LOGIC_VECTOR (15 downto 0);
    V : out STD_LOGIC);
end component;

-- define a clock period long enough for the alu to run
constant clk_period: Time := 80 ns;

begin
-- instansiate the unit under test
uut : alu_16bit port map(
    A => A,
    B => B,
    s0 => s0,
    s1 => s1,
    s2 => s2,
    c_in => c_in,
    c_out => c_out,
    G => G,
    V => V);
    
-- begin process
stim_proc : process
begin
A <= "1010101010101010";
B <= "0101010101010101";
-- Keep these signals the same throughout the testbench
-- Check the various operations on them and look at outputs
-- A = 0xAAAA, B = 0x5555

s2 <= '0';
s1 <= '0';
s0 <= '0';
c_in <= '0';
wait for clk_period;
-- G = A = 0xAAAA
-- c_out = 0

s2 <= '0';
s1 <= '0';
s0 <= '0';
c_in <= '1';
wait for clk_period;
-- G = A+1 = 0xAAAB
-- c_out = 0

s2 <= '0';
s1 <= '0';
s0 <= '1';
c_in <= '0';
wait for clk_period;
-- G = A+B = 0xFFFF
-- c_out = 0

s2 <= '0';
s1 <= '0';
s0 <= '1';
c_in <= '1';
wait for clk_period;
-- G = A+B+1 = 0xFFFF
-- c_out = 1

s2 <= '0';
s1 <= '1';
s0 <= '0';
c_in <= '0';
wait for clk_period;
-- G = A+not(B) = 0x5554
-- c_out = 1

s2 <= '0';
s1 <= '1';
s0 <= '0';
c_in <= '1';
wait for clk_period;
-- G = A+not(B)+1 = 0x5555
-- c_out = 1

s2 <= '0';
s1 <= '1';
s0 <= '1';
c_in <= '0';
wait for clk_period;
-- G = A+0xFFFF = 0xAAA9
-- c_out = 1

s2 <= '0';
s1 <= '1';
s0 <= '1';
c_in <= '1';
wait for clk_period;
-- G = A+0xFFFF+1 = 0xAAAA
-- c_out = 1

s2 <= '1';
s1 <= '0';
s0 <= '0';
wait for clk_period;
-- G = A AND B = 0x0000

s2 <= '1';
s1 <= '0';
s0 <= '1';
wait for clk_period;
-- G = A OR B = 0xFFFF

s2 <= '1';
s1 <= '1';
s0 <= '0';
wait for clk_period;
-- G = A XOR B = 0xFFFF

s2 <= '1';
s1 <= '1';
s0 <= '1';
wait for clk_period;
-- G = NOT A = 0x5555

end process;    
end Test;