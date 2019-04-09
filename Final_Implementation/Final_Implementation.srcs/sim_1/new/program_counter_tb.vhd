library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter_tb is
end program_counter_tb;

architecture Test of program_counter_tb is

-- define signals in testbench to map to inputs and outputs
signal address : STD_LOGIC_VECTOR (15 downto 0);
signal PL : STD_LOGIC;
signal PI : STD_LOGIC;
signal clk : STD_LOGIC;
signal reset : STD_LOGIC;
signal PC_out : STD_LOGIC_VECTOR (15 downto 0);

-- define the component to tst
component program_counter port(
    address : in STD_LOGIC_VECTOR (15 downto 0);
    PL : in STD_LOGIC;
    PI : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    PC_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- define a clock period long enough for the pc to run
constant clk_period: Time := 15 ns;

begin
-- Instansiate the Unit Under Test (UUT)
uut: program_counter port map (
    address => address,
    PL => PL,
    PI => PI,
    clk => clk,
    reset => reset,
    PC_out => PC_out
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
-- output should still be undefined as PL = 0
address <= X"00AA";

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';
-- load the value on the next HIGH
PL <= '1';

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';
-- increment for the next few clock cycles
PL <= '0';
PI <= '1';

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
PL <= '1';
PI <= '0';
address <= X"0010";

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';
-- reset and increment
PL <= '0';
PI <= '1';
reset <= '1';

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';
reset <= '0';

wait for clk_period;
clk <= '1';
-- turn off signals for next cycle of simulation
PL <= '0';
PI <= '0';

wait for clk_period;
end process;
end Test;
