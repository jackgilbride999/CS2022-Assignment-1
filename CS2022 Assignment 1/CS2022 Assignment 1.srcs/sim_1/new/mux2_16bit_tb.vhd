library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2_16bit_tb is
end mux2_16bit_tb;

architecture Test of mux2_16bit_tb is
-- Component Declaration for the Unit Under Test (UUT)
component mux2_16bit is
    Port ( in0 : in STD_LOGIC_VECTOR (15 downto 0);
           in1 : in STD_LOGIC_VECTOR (15 downto 0);
           s : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--INPUTS
signal s : STD_LOGIC;
signal in0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal in1: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

--OUTPUTS
signal Z : STD_LOGIC_VECTOR (15 downto 0);

--CLOCK
constant clk_period : time := 10 ns;
begin

-- Instansiate the Unit Under Test (UUT)
uut: mux2_16bit port map (
    in0 => in0,
    in1 =>in1,
    s => s,
    z=>z
);

-- The output for this process should be unknown for clk_period, followed
-- by the value of in0 for clk_period, followed by the value of in1 for
-- clk_period
stim_proc: process
begin
in0<= "1010101010101010";
in1<= "1111111100000000";

wait for clk_period;
s <= '0';

wait for clk_period;
s <= '1';

wait for clk_period;
end process;
end Test;
