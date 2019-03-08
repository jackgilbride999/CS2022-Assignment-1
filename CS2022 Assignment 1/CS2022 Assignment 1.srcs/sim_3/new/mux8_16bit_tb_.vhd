library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_16bit_tb is
end mux8_16bit_tb;

architecture Test of mux8_16bit_tb is
-- Component Declaration for the Unit Under Test (UUT)
component mux8_16bit is
    Port ( in0 : in STD_LOGIC_VECTOR (15 downto 0);
           in1 : in STD_LOGIC_VECTOR (15 downto 0);
           in2 : in STD_LOGIC_VECTOR (15 downto 0);
           in3 : in STD_LOGIC_VECTOR (15 downto 0);
           in4 : in STD_LOGIC_VECTOR (15 downto 0);
           in5 : in STD_LOGIC_VECTOR (15 downto 0);
           in6 : in STD_LOGIC_VECTOR (15 downto 0);
           in7 : in STD_LOGIC_VECTOR (15 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           s2 : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--INPUTS
signal s0 : STD_LOGIC;
signal s1 : STD_LOGIC;
signal s2 : STD_LOGIC;
signal in0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal in1: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal in2: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal in3: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal in4: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal in5: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal in6: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal in7: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

--OUTPUTS
signal Z : STD_LOGIC_VECTOR (15 downto 0);

--CLOCK
constant clk_period : time := 10 ns;

begin
-- Instansiate the Unit Under Test (UUT)
uut: mux8_16bit port map (
    in0 => in0,
    in1 =>in1,
    in2 =>in2,
    in3 =>in3,
    in4 =>in4,
    in5 =>in5,
    in6 =>in6,
    in7 =>in7,
    s0 => s0,
    s1 => s1,
    s2 => s2,
    z=>z
);

-- The output for this process should be unknown for clk_period, then
-- the value of in0 for clk_period, then the value of in1 for clk_period etc
stim_proc: process
begin

in0<= "0000000000000000";
in1<= "0000000000000001";
in2<= "0000000000000010";
in3<= "0000000000000011";
in4<= "0000000000000100";
in5<= "0000000000000101";
in6<= "0000000000000110";
in7<= "0000000000000111";

wait for clk_period;
s0 <= '0';
s1 <= '0';
s2 <= '0';

wait for clk_period;
s0 <= '0';
s1 <= '0';
s2 <= '1';

wait for clk_period;
s0 <= '0';
s1 <= '1';
s2 <= '0';

wait for clk_period;
s0 <= '0';
s1 <= '1';
s2 <= '1';

wait for clk_period;
s0 <= '1';
s1 <= '0';
s2 <= '0';

wait for clk_period;
s0 <= '1';
s1 <= '0';
s2 <= '1';

wait for clk_period;
s0 <= '1';
s1 <= '1';
s2 <= '0';

wait for clk_period;
s0 <= '1';
s1 <= '1';
s2 <= '1';

wait for clk_period;
end process;
end Test;
