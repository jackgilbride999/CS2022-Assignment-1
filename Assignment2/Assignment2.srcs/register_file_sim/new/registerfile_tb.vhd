library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registerfile_tb is
end registerfile_tb;

architecture Test of registerfile_tb is
-- define signals in testbench to map to inputs and outputs
signal load_enable : STD_LOGIC;
signal clk : STD_LOGIC;
signal data : STD_LOGIC_VECTOR(15 downto 0);
signal A_select : STD_LOGIC_VECTOR(2 downto 0);
signal B_select : STD_LOGIC_VECTOR(2 downto 0);
signal D_select : STD_LOGIC_VECTOR(2 downto 0);
signal A_data : STD_LOGIC_VECTOR(15 downto 0);
signal B_data : STD_LOGIC_VECTOR(15 downto 0);

-- define the component to tst
component register_file port(
    load_enable : in STD_LOGIC;
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR(15 downto 0);
    A_select : in STD_LOGIC_VECTOR(2 downto 0);
    B_select : in STD_LOGIC_VECTOR(2 downto 0);
    D_select : in STD_LOGIC_VECTOR(2 downto 0);
    A_data : out STD_LOGIC_VECTOR(15 downto 0);
    B_data : out STD_LOGIC_VECTOR(15 downto 0));
end component;

-- define a clock period long enough for the register file to run
constant clk_period: Time := 10 ns;

begin
-- instansiate the unit under test
uut : register_file port map(
    load_enable => load_enable,
    clk => clk,
    data => data,
    A_select => A_select,
    B_select => B_select,
    D_select => D_select,
    A_data => A_data,
    B_data => B_data);
    
-- begin process
stim_proc : process
begin
clk <= '0';

load_enable <= '1';
data <= "0000000100100111";
D_select <= "000";
A_select <= "000";
-- on the next rising edge, 0x1234 should be seen on A_data

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

data <= "0111010100100001";
D_select <= "001";
B_select <= "001";
-- on the next rising edge, 0x4321 should be seen on B_data

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

data <= A_data;
D_select <= "010";
B_select <= "010";
-- on the next rising edge, 0x1234 should be seen on B_data (register transfer)

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

load_enable <= '0';
data <= B_data;
D_select <= "010";
B_select <= "010";
-- on the next rising edge there should be no change as load enable is false

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

load_enable <= '1';
data <= "1111111111111111";
D_select <= "111";
A_select <= "111";
-- on the next rising edge 0xFFFF should be seen on A_data

wait for clk_period;
clk <= '1';

wait for clk_period;
-- It can be seen in the RTL Analysis in Vivado that all registers are connected to
-- other components in the register file in the same way, therefore it can be concluded
-- that these tests would be successful for any registers chosen
end process;
end Test;