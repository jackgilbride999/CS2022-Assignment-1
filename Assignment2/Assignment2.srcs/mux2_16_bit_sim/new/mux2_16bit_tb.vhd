library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_16bit_tb is
end mux2_16bit_tb;

architecture Test of mux2_16bit_tb is
-- define signals in testbench to map to inputs and outputs
signal in0 : STD_LOGIC_VECTOR(15 downto 0);
signal in1 : STD_LOGIC_VECTOR(15 downto 0);
signal s : STD_LOGIC;
signal Z : STD_LOGIC_VECTOR(15 downto 0);

-- define the component to test
component mux2_16bit port(
    in0 : in STD_LOGIC_VECTOR(15 downto 0);
    in1 : in STD_LOGIC_VECTOR(15 downto 0);
    s : in STD_LOGIC;
    Z : out STD_LOGIC_VECTOR(15 downto 0));
end component;

-- define a clock period long enough for the mux to run
constant clk_period: Time := 2 ns;

begin
-- instansiate the unit under test
uut : mux2_16bit port map(
    in0 => in0,
    in1 => in1,
    s => s,
    Z => Z);
    
-- begin process
stim_proc : process
begin
in0 <= "0000000000000000";
in1 <= "1111111111111111";
-- outputs should be undefined at this point
-- keep in0 and in1 constant and test the change in Z against s

wait for clk_period;
s <= '0';
-- Z = in0 = 0x0000

wait for clk_period;
s <= '1';
-- Z = in1 = 0xFFFF

wait for clk_period;
-- no change, Z = in1 = 0xFFFF

wait for clk_period;
s <= '0';
-- Z = in0 = 0x0000

wait for clk_period;
s <= '1';
-- Z = in1 = 0XFFFF
end process;
end Test;