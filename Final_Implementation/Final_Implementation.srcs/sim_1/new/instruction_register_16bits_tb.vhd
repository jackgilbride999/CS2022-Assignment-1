library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register_16bits_tb is
end instruction_register_16bits_tb;

architecture Test of instruction_register_16bits_tb is
-- define signals in testbench to map to inputs and outputs
signal instruction_in : STD_LOGIC_VECTOR (15 downto 0);
signal IL : STD_LOGIC;
signal clk : STD_LOGIC;
signal opcode : STD_LOGIC_VECTOR (6 downto 0);
signal DR : STD_LOGIC_VECTOR (2 downto 0);
signal SA : STD_LOGIC_VECTOR (2 downto 0);
signal SB : STD_LOGIC_VECTOR (2 downto 0);

-- define the component to test
component instruction_register_16bits port(
      instruction_in : in STD_LOGIC_VECTOR (15 downto 0);
      IL : in STD_LOGIC;
      clk : in STD_LOGIC;
      opcode : out STD_LOGIC_VECTOR (6 downto 0);
      DR : out STD_LOGIC_VECTOR (2 downto 0);
      SA : out STD_LOGIC_VECTOR (2 downto 0);
      SB : out STD_LOGIC_VECTOR (2 downto 0));
end component;

-- define a clock period long enough for the register to run
constant clk_period: Time := 2 ns;

begin
-- instanstiate the unit undr test
uut : instruction_register_16bits port map(
    instruction_in => instruction_in,
    IL => IL,
    clk => clk,
    opcode => opcode,
    DR => DR,
    SA => SA,
    SB => SB);
    
-- begin process
stim_proc : process
begin
clk <= '0';

instruction_in <= "1111111111111111";
IL <= '0';
-- D has a value but load is false, so outputs should be undefined on the next rising edge

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

IL <= '1';
-- load is now true so outputs shopuld be all 1s on the next rising edge

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

instruction_in <= "0111011101110111";
-- load is still true so opcode = 0x3B, DL = 0x5, SA = 0x6, SB = 0x7 on the next rising edge

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';

instruction_in <= "0000000000000000";
IL <= '0';
-- outputs should never be 0 as load is false

wait for clk_period;
clk <= '1';

wait for clk_period;
clk <= '0';
IL <= '1';
-- output should now be 0s

wait for clk_period;
clk <= '1';

wait for clk_period;
end process;

end Test;
