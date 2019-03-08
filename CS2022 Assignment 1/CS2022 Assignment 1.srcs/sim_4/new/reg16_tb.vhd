library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg16_tb is
end reg16_tb;

architecture Test of reg16_tb is
-- Component Declaration for the Unit Under Test (UUT)
component reg16 is
    Port (D : in STD_LOGIC_VECTOR (15 downto 0);
           load : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- Inputs
signal D : STD_LOGIC_VECTOR(15 downto 0);
signal load : STD_LOGIC;
signal clk : STD_LOGIC;

-- Outputs
signal Q : STD_LOGIC_VECTOR(15 downto 0);

--CLOCK
constant clk_period : time := 20 ns;

begin
-- Instansiate the Unit Under Test (UUT)
uut: reg16 port map (
    D => D,
    load => load,
    clk => clk,
    Q => Q
);

stim_proc: process
begin

D <= "0000000000000000";
load <= '1';

-- RISING EDGE
wait for clk_period;
clk <= '1';

wait for clk_period/2;
-- This signal should never be seen
-- as it is changed again before the
-- rising edge of the clock.
D <= "1111111111111111";

-- FALLING EDGE
wait for clk_period/2;
clk <= '0';

wait for clk_period/2;
D <= "1010101010101010";

-- RISING EDGE
wait for clk_period/2;
clk <= '1';

wait for clk_period/2;
load <= '0';
-- This signal should also never be
-- seen on the output as load is LOW.
D <= "1111111100000000";

-- FALLING EDGE
wait for clk_period/2;
clk <= '0';

-- RISING EDGE
wait for clk_period;
clk <= '1';

-- FALLING EDGE
wait for clk_period;
clk <= '0';

-- RISING EDGE
wait for clk_period;
clk <= '1';

-- FALLING EDGE
wait for clk_period;
clk <= '0';

end process;
end Test;