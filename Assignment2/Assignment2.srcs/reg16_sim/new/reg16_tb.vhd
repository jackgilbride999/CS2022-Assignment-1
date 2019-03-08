library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg16_tb is
end reg16_tb;

architecture Test of reg16_tb is
-- define signals in testbench to map to inputs and outputs
signal D : STD_LOGIC_VECTOR(15 downto 0);
signal load : STD_LOGIC;
signal clk : STD_LOGIC;
signal Q : STD_LOGIC_VECTOR(15 downto 0);

-- define the component to test
component reg16 port(
    D : in STD_LOGIC_VECTOR(15 downto 0);
    load : in STD_LOGIC;
    clk : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR(15 downto 0));
end component;

-- define a clock period long enough for the register to run
constant clk_period: Time := 2 ns;

begin
-- instanstiate the unit undr test
uut : reg16 port map(
    D => D,
    load => load,
    clk => clk,
    Q => Q);
    
-- begin process
stim_proc : process
begin
clk <= '0';

D <= "1111111111111111";
load <= '0';
-- D has a value but load is false, so Z should be undefined on the next rising edge

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

load <= '1';
-- load is now true so Z should be 0xFFFF on the next rising edge

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

D <= "0111011101110111";
-- load is still true so Z should be D = 0x7777 on the next rising edge

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

D <= "0000000000000000";
load <= '0';
-- Z should never be 0x0000 as load is false

wait for clk_period;
clk <= '1';

wait for clk_period;

end process;
end Test;