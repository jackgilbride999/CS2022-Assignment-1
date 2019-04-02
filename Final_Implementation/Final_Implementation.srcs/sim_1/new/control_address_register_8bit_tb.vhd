library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_address_register_8bit_tb is
end control_address_register_8bit_tb;

architecture Test of control_address_register_8bit_tb is

-- define signals in testbench to map to inputs and outputs
signal in_address : STD_LOGIC_VECTOR (7 downto 0);
signal load_address : STD_LOGIC;
signal clk : STD_LOGIC;
signal address_out : STD_LOGIC_VECTOR (7 downto 0);

-- define the component to tst
component control_address_register_8bit port(
   in_address : in STD_LOGIC_VECTOR (7 downto 0);
   load_address : in STD_LOGIC;
   clk : in STD_LOGIC;
   address_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

-- define a clock period long enough for the pc to run
constant clk_period: Time := 15 ns;
begin
-- Instansiate the Unit Under Test (UUT)
uut: control_address_register_8bit port map (
    in_address => in_address,
    load_address => load_address,
    clk => clk,
    address_out => address_out
);

-- begin process
stim_proc : process
begin
-- Let the output be undefined for a few cycles
-- while the inputs have no value
clk <= '0';

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';
-- output should still be undefined as load_address has not been set
in_address <= X"AA";

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';
-- load the value on the next HIGH
load_address <= '1';

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';
-- increment for the next few clock cycles
load_address <= '0';

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';
-- load in one more value to test
load_address <= '1';
in_address <= X"10";

wait for clk_period;
clk <= '1';

wait for clk_period;

end process;

end Test;
