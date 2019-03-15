library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder_16bit_tb is
end ripple_adder_16bit_tb;

architecture Test of ripple_adder_16bit_tb is
-- define signals in testbench to map to inputs and outputs
signal X : STD_LOGIC_VECTOR (15 downto 0);
signal Y : STD_LOGIC_VECTOR (15 downto 0);
signal c_in : STD_LOGIC;
signal G : STD_LOGIC_VECTOR (15 downto 0);
signal c_out : STD_LOGIC;
signal V: STD_LOGIC;

-- define the component to test
component ripple_adder_16bit port(
    X : in STD_LOGIC_VECTOR (15 downto 0);
    Y : in STD_LOGIC_VECTOR (15 downto 0);
    c_in : in STD_LOGIC;
    G : out STD_LOGIC_VECTOR (15 downto 0);
    c_out : out STD_LOGIC;
    V : out STD_LOGIC);
end component;

-- define a clock period long enough for the adder to run
constant clk_period: Time := 80 ns;

begin
-- instansiate the unit under test
uut : ripple_adder_16bit port map(
    X => X,
    Y => Y,
    c_in => c_in,
    G => G,
    c_out => c_out,
    V => V);
    
-- begin process
stim_proc : process
begin
X <= "0000000000000000";
Y <= "0000000000000000";
c_in <= '0';
wait for clk_period;
-- G = 0x0000, c_out = 0

X <= "0000000000000000";
Y <= "0000000000000000";
c_in <= '1';
wait for clk_period;
-- G = 0x0001, c_out = 1

X <= "0000000011111111";
Y <= "0000000000000000";
c_in <= '0';
wait for clk_period;
-- G = 0x000FF, c_out = 0

X <= "0000000011111111";
Y <= "0000000011111111";
c_in <= '0';
wait for clk_period;
-- G = 0x01FE, c_out = 0

X <= "1000000000000000";
Y <= "1000000000000000";
c_in <= '0';
wait for clk_period;
-- G = 0x0000, c_out = 1

X <= "1111111111111111";
Y <= "1111111111111111";
c_in <= '0';
wait for clk_period;
-- G = 0xFFFE, c_out = 1

X <= "1111111111111111";
Y <= "1111111111111111";
c_in <= '1';
wait for clk_period;
-- G = 0xFFFF, c_out = 1

X <= "1111111111111111";
Y <= "0000000000000000";
c_in <= '1';
wait for clk_period;
-- G = 0x0000, c_out = 1
-- Note: Due to the ripple nature of the adder,
-- the output will be incorrect until the carry
-- has rippled through all 16 bits
end process;
end Test;