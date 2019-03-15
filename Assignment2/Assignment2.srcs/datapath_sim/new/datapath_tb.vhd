library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath_tb is
end datapath_tb;

architecture Test of datapath_tb is
-- define signals in testbench to map to inputs and outputs
signal constant_in : STD_LOGIC_VECTOR (15 downto 0);
signal MB_select : STD_LOGIC;
signal MD_select : STD_LOGIC;
signal data_in : STD_LOGIC_VECTOR (15 downto 0);
signal clk : STD_LOGIC;
signal write : STD_LOGIC;
signal D_address : STD_LOGIC_VECTOR(2 downto 0);
signal A_address : STD_LOGIC_VECTOR(2 downto 0);
signal B_address : STD_LOGIC_VECTOR(2 downto 0);
signal FS : STD_LOGIC_VECTOR(4 downto 0);
signal address_out : STD_LOGIC_VECTOR (15 downto 0);
signal data_out : STD_LOGIC_VECTOR (15 downto 0);
signal V : STD_LOGIC;
signal C : STD_LOGIC;
signal N : STD_LOGIC;
signal Z : STD_LOGIC;

-- define the component to test
component datapath port(
  constant_in : in STD_LOGIC_VECTOR (15 downto 0);
  MB_select : in STD_LOGIC;
  MD_select : in STD_LOGIC;
  data_in : in STD_LOGIC_VECTOR (15 downto 0);
  clk : in STD_LOGIC;
  write : in STD_LOGIC;
  D_address : in STD_LOGIC_VECTOR(2 downto 0);
  A_address : in STD_LOGIC_VECTOR(2 downto 0);
  B_address : in STD_LOGIC_VECTOR(2 downto 0);
  FS : in STD_LOGIC_VECTOR(4 downto 0);
  address_out : out STD_LOGIC_VECTOR (15 downto 0);
  data_out : out STD_LOGIC_VECTOR (15 downto 0);
  V : out STD_LOGIC;
  C : out STD_LOGIC;
  N : out STD_LOGIC;
  Z : out STD_LOGIC);
end component;

-- define a clock period long enough for the datapath to run
constant clk_period: Time := 80 ns;

begin
-- instansiate the unit under test
uut : datapath port map(
    constant_in => constant_in,
    MB_select => MB_select,
    MD_select => MD_select,
    data_in => data_in,
    clk => clk,
    write => write,
    D_address => D_address,
    A_address => A_address,
    B_address => B_address,
    FS => FS,
    address_out => address_out,
    data_out => data_out,
    V => V,
    C => C,
    N => N,
    Z => Z);
    
-- begin process
stim_proc : process
begin

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';
-- write value to register 0 and display it on address out
write <= '1';
D_address <= "000";
data_in <= "0000000000000000";
A_address <= "000";
B_address <= "000";
MB_select <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

-- rising edge
wait for clk_period;
clk <= '1';

-- falling edge
wait for clk_period;
clk <= '0';

end process;
end Test;