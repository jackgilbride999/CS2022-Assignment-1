library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter_tb is
end program_counter_tb;

architecture Test of program_counter_tb is

constant delay: Time := 1 ns;

-- define signals in testbench to map to inputs and outputs
signal address : STD_LOGIC_VECTOR (15 downto 0);
signal PL : STD_LOGIC;
signal PI : STD_LOGIC;
signal clk : STD_LOGIC;
signal PC_out : STD_LOGIC_VECTOR (15 downto 0);

-- define the component to tst
component program_counter port(
    address : in STD_LOGIC_VECTOR (15 downto 0);
    PL : in STD_LOGIC;
    PI : in STD_LOGIC;
    clk : in STD_LOGIC;
    PC_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- define a clock period long enough for the pc to run
constant clk_period: Time := 5 ns;

begin
-- Instansiate the Unit Under Test (UUT)
uut: program_counter port map (
    address => address,
    PL => PL,
    PI => PI,
    clk => clk,
    PC_out => PC_out
);

-- begin process
stim_proc : process
begin

end process;
end Test;
