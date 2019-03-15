library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Test of full_adder_tb is
-- define signals in testbench to map to inputs and outputs
signal in0 : STD_LOGIC;
signal in1 : STD_LOGIC;
signal c_in : STD_LOGIC;
signal sum : STD_LOGIC;
signal c_out : STD_LOGIC;
signal V : STD_LOGIC;

-- define the component to test
component full_adder port(
    in0 : in STD_LOGIC;
    in1 : in STD_LOGIC;
    c_in : in STD_LOGIC;
    sum : out STD_LOGIC;
    c_out : out STD_LOGIC);
end component;

-- define a clock period long enough for the adder to run
constant clk_period: Time := 5 ns;

begin
-- instansiate the unit under test
uut : full_adder port map(
    in0 => in0,
    in1 => in1,
    c_in => c_in,
    sum => sum,
    c_out => c_out);
    
-- begin process
stim_proc : process
begin
-- outputs should be undefined at this point

wait for clk_period;
in0 <= '0';
in1 <= '0';
c_in <= '0';
-- sum = 0, c_out = 0

wait for clk_period;
in0 <= '1';
in1 <= '0';
c_in <= '0';
-- sum = 1, c_out = 0

wait for clk_period;
in0 <= '0';
in1 <= '1';
c_in <= '0';
-- sum = 1, c_out = 0

wait for clk_period;
in0 <= '1';
in1 <= '1';
c_in <= '0';
-- sum = 0, c_out = 1

wait for clk_period;
in0 <= '0';
in1 <= '0';
c_in <= '1';
-- sum = 1, c_out = 0

wait for clk_period;
in0 <= '1';
in1 <= '0';
c_in <= '1';
-- sum = 0, c_out = 1

wait for clk_period;
in0 <= '0';
in1 <= '1';
c_in <= '1';
-- sum = -, c_out = 1

wait for clk_period;
in0 <= '1';
in1 <= '1';
c_in <= '1';
-- sum = 1, c_out = 1

end process;
end Test;