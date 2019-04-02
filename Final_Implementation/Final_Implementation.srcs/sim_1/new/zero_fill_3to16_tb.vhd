library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_fill_3to16_tb is
end zero_fill_3to16_tb;

architecture Test of zero_fill_3to16_tb is
-- define signals in testbench to map to inputs and outputs
signal in_3bits : STD_LOGIC_VECTOR(2 downto 0);
signal out_16bits : STD_LOGIC_VECTOR(15 downto 0);

-- define the component to test
component zero_fill_3to16 port(
    in_3bits : in STD_LOGIC_VECTOR(2 downto 0);
    out_16bits : out STD_LOGIC_VECTOR(15 downto 0));
end component;

-- define a clock period long enough for the mux to run
constant clk_period: Time := 2 ns;

begin
-- instansiate the unit under test
uut : zero_fill_3to16 port map(
    in_3bits => in_3bits,
    out_16bits => out_16bits);

-- begin process
stim_proc : process
begin
wait for clk_period;
-- the output should always be 0s followed by the input,
-- so test for different inputs
in_3bits <= "000";

wait for clk_period;
in_3bits <= "001";

wait for clk_period;
in_3bits <= "010";

wait for clk_period;
in_3bits <= "011";

wait for clk_period;
in_3bits <= "100";

wait for clk_period;
in_3bits <= "101";

wait for clk_period;
in_3bits <= "110";

wait for clk_period;
in_3bits <= "111";

end process;
end Test;
