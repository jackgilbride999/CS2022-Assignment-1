library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_unit_tb is
end shifter_unit_tb;

architecture Test of shifter_unit_tb is
-- define signals in testbench to map to inputs and outputs
signal B : STD_LOGIC_VECTOR (15 downto 0);
signal S : STD_LOGIC_VECTOR (1 downto 0);
signal IR : STD_LOGIC;
signal IL : STD_LOGIC;
signal H : STD_LOGIC_VECTOR (15 downto 0);

-- define the component to tst
component shifter_unit port(
    B : in STD_LOGIC_VECTOR (15 downto 0);
    S : in STD_LOGIC_VECTOR (1 downto 0);
    IR : in STD_LOGIC;
    IL : in STD_LOGIC;
    H : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- define a clock period long enough for the shifter unit to run
constant clk_period: Time := 5 ns;

begin
-- instansiate the unit under test
uut : shifter_unit port map(
    B => B,
    S => S,
    IR => IR,
    IL => IL,
    H => H);
    
-- begin process
stim_proc : process
begin
IL <= '0';
IR <= '0';
-- In our processor, these will always be set to low so only need to test when they are zero

-- S = "00" - transfer, S = "01" = shift right, S = "10" = shift left

wait for clk_period;
S <= "00";
B <= "1010101010101010";
-- Transfer - H = 1010101010101010

wait for clk_period;
S <= "10";
B <= H;
-- Shift Left - H = 0101010101010100

wait for clk_period;
S <= "10";
B <= H;
-- Shift Left - H = 1010101010101000

wait for clk_period;
S <= "10";
B <= H;
-- Shift Left - H = 0101010101010000

wait for clk_period;
S <= "00";
B <= H;
-- Transfer - H = 0101010101010000

wait for clk_period;
S <= "01";
B <= H;
-- Shift Right - H = 0010101010101000

wait for clk_period;
S <= "01";
B <= H;
-- Shift Right - H = 0001010101010100
end process;
end Test;