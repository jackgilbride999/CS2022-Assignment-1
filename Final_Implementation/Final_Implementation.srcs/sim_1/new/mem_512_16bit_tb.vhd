library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memory_512_16bit_tb is
end memory_512_16bit_tb;

architecture Test of memory_512_16bit_tb is
-- define signals in testbench to map to inputs and outputs
signal data_in : STD_LOGIC_VECTOR (15 downto 0);
signal address : STD_LOGIC_VECTOR (15 downto 0);
signal MW : STD_LOGIC;
signal data_out : STD_LOGIC_VECTOR (15 downto 0);

-- define the component to test
component memory_512_16bit port(
   data_in : in STD_LOGIC_VECTOR (15 downto 0);
   address : in STD_LOGIC_VECTOR (15 downto 0);
   MW : in STD_LOGIC;
   data_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- define a clock period long enough for the mux to run
constant clk_period: Time := 5 ns;

begin
-- instansiate the unit under test
uut : memory_512_16bit port map(
    data_in => data_in,
    address => address,
    MW => MW,
    data_out => data_out);
    
-- begin process
stim_proc : process
begin
MW <= '1';
data_in <= X"0000";
address <= X"0000";
-- write 0x0000 to address 0x0000

wait for clk_period;

data_in <= X"0001";
address <= X"0001";
-- write 0x0001 to address 0x0001

wait for clk_period;

data_in <= X"0002";
address <= X"0002";
-- write 0x0002 to address 0x0002

wait for clk_period;

data_in <= X"0003";
address <= X"0003";
-- write 0x0003 to address 0x0003

wait for clk_period;

MW <= '0';
address <= X"0000";
-- data_out == 0x0000

wait for clk_period;

address <= X"0001";
-- data_out == 0x0001

wait for clk_period;

address <= X"0002";
-- data_out == 0x0002

wait for clk_period;


address <= X"0003";
-- data_out == 0x0003

wait for clk_period;


address <= X"0004";
-- data_out == 0x0000

wait for clk_period;
end process;
end Test;
