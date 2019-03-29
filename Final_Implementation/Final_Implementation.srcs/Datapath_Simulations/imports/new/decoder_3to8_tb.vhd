library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_3to8_tb is
end decoder_3to8_tb;

architecture Test of decoder_3to8_tb is
-- Component Declaration for the Unit Under Test (UUT)
component decoder_3to8 is
    Port (  A0 : in STD_LOGIC;
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

--INPUTS
signal A0 : STD_LOGIC;
signal A1 : STD_LOGIC;
signal A2 : STD_LOGIC;

--OUTPUTS
signal Q0 : STD_LOGIC;
signal Q1 : STD_LOGIC;
signal Q2 : STD_LOGIC;
signal Q3 : STD_LOGIC;
signal Q4 : STD_LOGIC;
signal Q5: STD_LOGIC;
signal Q6 : STD_LOGIC;
signal Q7 : STD_LOGIC;

--CLOCK
constant clk_period : time := 2 ns;

begin
-- Instansiate the Unit Under Test (UUT)
uut: decoder_3to8 port map (
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
    Q7 => Q7
);


-- The output for this process should be unknown for clk_period, then Q0
-- high for clk_period, then Q1 high for clk_period, etc
stim_proc: process
begin

wait for clk_period;
A0 <= '0';
A1 <= '0';
A2 <= '0';

wait for clk_period;
A0 <= '0';
A1 <= '0';
A2 <= '1';

wait for clk_period;
A0 <= '0';
A1 <= '1';
A2 <= '0';

wait for clk_period;
A0 <= '0';
A1 <= '1';
A2 <= '1';

wait for clk_period;
A0 <= '1';
A1 <= '0';
A2 <= '0';

wait for clk_period;
A0 <= '1';
A1 <= '0';
A2 <= '1';

wait for clk_period;
A0 <= '1';
A1 <= '1';
A2 <= '0';

wait for clk_period;
A0 <= '1';
A1 <= '1';
A2 <= '1';
end process;
end Test;