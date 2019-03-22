library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity functional_unit_tb is
end functional_unit_tb;

architecture Test of functional_unit_tb is
-- define signals in testbench to map to inputs and outputs
signal A : STD_LOGIC_VECTOR (15 downto 0);
signal B : STD_LOGIC_VECTOR (15 downto 0);
signal FS : STD_LOGIC_VECTOR (4 downto 0);
signal F : STD_LOGIC_VECTOR (15 downto 0);
signal V : STD_LOGIC;
signal C : STD_LOGIC;
signal N : STD_LOGIC;
signal Z : STD_LOGIC;

-- define the component to test
component functional_unit port(
    A : in STD_LOGIC_VECTOR (15 downto 0);
    B : in STD_LOGIC_VECTOR (15 downto 0);
    FS : in STD_LOGIC_VECTOR (4 downto 0);
    F : out STD_LOGIC_VECTOR (15 downto 0);
    V : out STD_LOGIC;
    C : out STD_LOGIC;
    N : out STD_LOGIC;
    Z : out STD_LOGIC);
end component;

-- define a clock period long enough for the unit to run
constant clk_period: Time := 80 ns;

begin
-- instansiate the unit under test
uut : functional_unit port map(
    A => A,
    B => B,
    FS => FS,
    F => F,
    V => V,
    C => C,
    N => N,
    Z => Z);
    
-- begin process
stim_proc : process
begin
A <= "1010101010101010";
B <= "0101010101010101";
-- Fix A and B, change FS and check if outputs
-- are as expected for each FS code

FS <= "00000";
wait for clk_period;
-- F=A=0xAAAA
-- V=0, C=0, N=1, Z=0

FS <= "00001";
wait for clk_period;
-- F=A+1=0xAAAB
-- V=0, C=0, N=1, Z=0

FS <= "00010";
wait for clk_period;
-- F=0xFFFF
-- V=0, C=0, N=1, Z=0

FS <= "00011";
wait for clk_period;
-- F=A+B+1=0x0000
-- V=1, C=1, N=0, Z=1

FS <= "00100";
wait for clk_period;
-- F=A+(not)B=0x5554
-- V=1, C=1, N=0, Z=0

FS <= "00101";
wait for clk_period;
-- F=A+(not)B+1=0x5555
-- V=1, C=1, N=0, Z=0

FS <= "00110";
wait for clk_period;
-- F=A+0xFFFF=0xAAA9
-- V=0, C=1, N=1, Z=0

FS <= "00111";
wait for clk_period;
-- F=A+0xFFFF+1=0xAAAA
-- V=0, C=1, N=1, Z=0

-- Overflow and Carry flags are
-- set by adder so are not defined
-- for the operations below

FS <= "01000";
wait for clk_period;
-- F=A&B=0x0000
-- N=0, Z=1

FS <= "01010";
wait for clk_period;
-- F=A|B=0xFFFF
-- N=1, Z=0

FS <= "01100";
wait for clk_period;
-- F=A^B=0xFFFF
-- N=1, Z=0

FS <= "01110";
wait for clk_period;
-- F=!A=0x5555
-- N=0, Z=0

FS <= "10000";
wait for clk_period;
-- F=B=0x5555
-- N=0, Z=0

FS <= "10100";
wait for clk_period;
-- F=srB=0x2AAA
-- N=0, Z=0

FS <= "11000";
wait for clk_period;
-- F=slB=0xAAAA
-- N=1, Z=0

end process;    
end Test;