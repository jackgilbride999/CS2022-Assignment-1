library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_detector_tb is
end zero_detector_tb;

architecture Test of zero_detector_tb is
-- define signals in testbench to map to inputs and outputs
signal G : STD_LOGIC_VECTOR(15 downto 0);
signal Z : STD_LOGIC;

-- define the component to test
component zero_detector_16bit port(
    G : in STD_LOGIC_VECTOR(15 downto 0);
    Z : out STD_LOGIC);
end component;

-- define a clock period long enough for the zero detector to run
constant clk_period: Time := 2 ns;

begin
-- instansiate the unit under test
uut : zero_detector_16bit port map(
    G => G,
    Z => Z);
    
-- begin process
stim_proc : process
begin
G <= "1111111111111111";
-- for the next few clock periods, Z should be low

wait for clk_period;
-- no change

wait for clk_period;
G <= "1010101010101010";

wait for clk_period;
G <= "0000000000000001";

wait for clk_period;
G <= "1000000000000000";

wait for clk_period;
G <= "0000000000000000";
-- Z should now become high

wait for clk_period;
-- no change

wait for clk_period;
G <= "0000000000000000";

wait for clk_period;

wait for clk_period;
G <= "0111111111111110";
-- Z should go back to high

wait for clk_period;


-- TODO
end process;
end Test;