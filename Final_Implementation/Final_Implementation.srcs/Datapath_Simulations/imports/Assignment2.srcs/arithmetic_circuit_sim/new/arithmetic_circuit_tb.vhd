library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_circuit_tb is
end arithmetic_circuit_tb;

architecture Test of arithmetic_circuit_tb is
-- define signals in testbench to map to inputs and outputs
signal c_in : STD_LOGIC;
signal A : STD_LOGIC_VECTOR (15 downto 0);
signal B : STD_LOGIC_VECTOR (15 downto 0);
signal s0 : STD_LOGIC;
signal s1 : STD_LOGIC;
signal G : STD_LOGIC_VECTOR (15 downto 0);
signal c_out : STD_LOGIC;
signal V : STD_LOGIC;

-- define the component to test
component arithmetic_circuit port(
    c_in : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR (15 downto 0);
    B : in STD_LOGIC_VECTOR (15 downto 0);
    s0 : in STD_LOGIC;
    s1 : in STD_LOGIC;
    G : out STD_LOGIC_VECTOR (15 downto 0);
    c_out : out STD_LOGIC;
    V : out STD_LOGIC);
end component;

-- define a clock period long enough for the circuit to run
constant clk_period: Time := 80 ns;


begin
-- instansiate the unit under test
uut : arithmetic_circuit port map(
    c_in => c_in,
    A => A,
    B => B,
    s0 => s0,
    s1 => s1,
    G => G,
    c_out => c_out,
    V => V);
    
-- begin process
stim_proc : process
begin

-- Test X+Y when X=A, Y=0x0000
s0 <= '0';
s1 <= '0';
B <= "1010101010101010"; 

A <= "0000000000000000";
c_in <= '0';
wait for clk_period;
-- G = A = 0x0000
-- c_out = 0

A <= "1010101010101010";
c_in <= '0';
 wait for clk_period;
 -- G = A = 0x000A
 -- c_out = 0
 
A <= "1111111111111111";
c_in <= '0';
wait for clk_period;
-- G = A = 0xFFFF
-- c_out = 0

A <= "0000000000000000";
c_in <= '1';
wait for clk_period;
-- G = A+1 = 0x0001
-- c_out = 0

A <= "1010101010101010";
c_in <= '1';
 wait for clk_period;
 -- G = A+1 = 0xAAAB
 -- c_out = 0
 
A <= "1111111111111111";
c_in <= '1';
wait for clk_period;
-- G = A+1 = 0x0000
-- c_out = 1

-- Test X+Y when X=A, Y=B
s0 <= '0';
s1 <= '1';

A <= "0000000000000000";
B <= "0000000000000000";
c_in <= '0';
wait for clk_period;
-- G = A+B = 0x0000
-- c_out = 0

A <= "1010101010101010";
B <= "0000000000000000";
c_in <= '0';
wait for clk_period;
-- G = A+B = 0xAAAA
-- c_out = 0

A <= "0000000000000000";
B <= "1010101010101010";
c_in <= '0';
wait for clk_period;
-- G = A+B = 0xAAAA
-- c_out = 0

A <= "1111111111111111";
B <= "1111111111111111";
c_in <= '0';
wait for clk_period;
-- G = A+B = 0xFFFE
-- c_out = 1

A <= "0000000000000000";
B <= "0000000000000000";
c_in <= '1';
wait for clk_period;
-- G = A+B+1 = 0x0001
-- c_out = 0

A <= "1010101010101010";
B <= "0000000000000000";
c_in <= '1';
wait for clk_period;
-- G = A+B+1 = 0xAAAB
-- c_out = 0

A <= "0000000000000000";
B <= "1010101010101010";
c_in <= '1';
wait for clk_period;
-- G = A+B+1 = 0xAAAB
-- c_out = 0

A <= "1111111111111111";
B <= "1111111111111111";
c_in <= '1';
wait for clk_period;
-- G = A+B+1 = 0xFFFF
-- c_out = 1

-- Test X+Y when X=A, Y=(not)B
s0 <= '1';
s1 <= '0';

A <= "0000000000000000";
B <= "0000000000000000";
c_in <= '0';
wait for clk_period;
-- G = A+(not)B = 0xFFFF
-- c_out = 0

A <= "1010101010101010";
B <= "0000000000000000";
c_in <= '0';
wait for clk_period;
-- G = A+(not)B = 0xAAA9
-- c_out = 1

A <= "0000000000000000";
B <= "1010101010101010";
c_in <= '0';
wait for clk_period;
-- G = A+(not)B = 0x5555
-- c_out = 0

A <= "1111111111111111";
B <= "1111111111111111";
c_in <= '0';
wait for clk_period;
-- G = A+(not)B = 0xFFFF
-- c_out = 0

A <= "0000000000000000";
B <= "0000000000000000";
c_in <= '1';
wait for clk_period;
-- G = A+B+1 = 0x0001
-- c_out = 0

A <= "1010101010101010";
B <= "0000000000000000";
c_in <= '1';
wait for clk_period;
-- G = A-B = 0xAAAA
-- c_out = 0

A <= "0000000000000000";
B <= "1010101010101010";
c_in <= '1';
wait for clk_period;
-- G = A-B = 0x5556
-- c_out = 0

A <= "1111111111111111";
B <= "1111111111111111";
c_in <= '1';
wait for clk_period;
-- G = A-B = 0x0000
-- c_out = 0

-- Test X+Y when X=A, Y=0xFFFF
s0 <= '1';
s1 <= '1';
B <= "1010101010101010"; 

A <= "0000000000000000";
c_in <= '0';
wait for clk_period;
-- G = A+0xFFFF = 0xFFFF
-- c_out = 0

A <= "1010101010101010";
c_in <= '0';
 wait for clk_period;
 -- G = A+0xFFFF = AAA9
 -- c_out = 1
 
A <= "1111111111111111";
c_in <= '0';
wait for clk_period;
-- G = A+0xFFFF = 0xFFFE
-- c_out = 1

A <= "0000000000000000";
c_in <= '1';
wait for clk_period;
-- G = A+0xFFFF+1 = 0x0000
-- c_out = 1

A <= "1010101010101010";
c_in <= '1';
 wait for clk_period;
 -- G = A+0xFFFF+1 = 0xAAAa
 -- c_out = 1
 
A <= "1111111111111111";
c_in <= '1';
wait for clk_period;
-- G = A+B+1 = 0xFFFF
-- c_out = 1
end process;
end Test;