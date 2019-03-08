library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_3to8_tb is
end decoder_3to8_tb;

architecture Test of decoder_3to8_tb is
-- define signals in testbench to map to inputs and outputs
signal A0 : STD_LOGIC;
signal A1 : STD_LOGIC;
signal A2 : STD_LOGIC;
signal Q0 : STD_LOGIC;
signal Q1 : STD_LOGIC;
signal Q2 : STD_LOGIC;
signal Q3 : STD_LOGIC;
signal Q4 : STD_LOGIC;
signal Q5 : STD_LOGIC;
signal Q6 : STD_LOGIC;
signal Q7 : STD_LOGIC;

-- define the component to test
component decoder_3to8 port(
    A0 : in STD_LOGIC;
    A1 : in STD_LOGIC;
    A2 : in STD_LOGIC;
    Q0 : out STD_LOGIC;
    Q1 : out STD_LOGIC;
    Q2 : out STD_LOGIC;
    Q3 : out STD_LOGIC;
    Q4 : out STD_LOGIC;
    Q5 : out STD_LOGIC;
    Q6 : out STD_LOGIC;
    Q7 : out STD_LOGIC);
end component;

-- define a clock period long enough for the decoder to run
constant clk_period: Time := 2 ns;

begin
-- instansiate the unit under test
uut : decoder_3to8 port map(
    A0 => A0,
    A1 => A1,
    A2 => A2,
    Q0 => Q0,
    Q1 => Q1,
    Q2 => Q2,
    Q3 => Q3,
    Q4 => Q4,
    Q5 => Q5,
    Q6 => Q6,
    Q7 => Q7);
    
-- begin process
stim_proc : process
begin
-- outputs should be undefined at this point

wait for clk_period;
A0 <= '0';
A1 <= '0';
A2 <= '0';
-- Q0 should be high, all others low

wait for clk_period;
A0 <= '0';
A1 <= '0';
A2 <= '1';
-- Q1 should be high, all others low

wait for clk_period;
A0 <= '0';
A1 <= '1';
A2 <= '0';
-- Q2 should be high, all others low

wait for clk_period;
A0 <= '0';
A1 <= '1';
A2 <= '1';
-- Q3 should be high, all others low

wait for clk_period;
A0 <= '1';
A1 <= '0';
A2 <= '0';
-- Q4 should be high, all others low

wait for clk_period;
A0 <= '1';
A1 <= '0';
A2 <= '1';
-- Q5 should be high, all others low

wait for clk_period;
A0 <= '1';
A1 <= '1';
A2 <= '0';
-- Q6 should be high, all others low

wait for clk_period;
A0 <= '1';
A1 <= '1';
A2 <= '1';
-- Q7 should be high, all others low
end process;
end Test;
