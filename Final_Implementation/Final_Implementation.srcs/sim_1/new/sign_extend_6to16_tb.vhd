library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_extend_6to16_tb is
end sign_extend_6to16_tb;

architecture Test of sign_extend_6to16_tb is
-- define signals in testbench to map to inputs and outputs
signal in_6bits : STD_LOGIC_VECTOR(5 downto 0);
signal out_16bits : STD_LOGIC_VECTOR(15 downto 0);

-- define the component to test
component sign_extend_6to16 port(
    in_6bits : in STD_LOGIC_VECTOR(5 downto 0);
    out_16bits : out STD_LOGIC_VECTOR(15 downto 0));
end component;

-- define a clock period long enough for the sign extend to run
constant clk_period: Time := 2 ns;

begin
-- instansiate the unit under test
uut : sign_extend_6to16 port map(
    in_6bits => in_6bits,
    out_16bits => out_16bits);

-- begin process
stim_proc : process
begin
-- the output should always be the sign extended input
wait for clk_period;
in_6bits <= "000000";

wait for clk_period;
in_6bits <= "000001";

wait for clk_period;
in_6bits <= "011111";

wait for clk_period;
in_6bits <= "100000";

wait for clk_period;
in_6bits <= "111111";

wait for clk_period;
in_6bits <= "010101";
end process;
end Test;
