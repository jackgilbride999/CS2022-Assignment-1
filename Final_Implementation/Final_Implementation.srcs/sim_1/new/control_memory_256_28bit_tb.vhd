library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_memory_256_28bit_tb is
end control_memory_256_28bit_tb;

architecture Test of control_memory_256_28bit_tb is

-- define signals in testbench to map to inputs and outputs
signal IN_CAR : STD_LOGIC_VECTOR (7 downto 0);
signal MW : STD_LOGIC;
signal MM : STD_LOGIC;
signal RW : STD_LOGIC;
signal MD : STD_LOGIC;
signal FS : STD_LOGIC_VECTOR(4 downto 0);
signal MB : STD_LOGIC;
signal TB : STD_LOGIC;
signal TA : STD_LOGIC;
signal TD : STD_LOGIC;
signal PL : STD_LOGIC;
signal PI : STD_LOGIC;
signal IL : STD_LOGIC;
signal MC : STD_LOGIC;
signal MS : STD_LOGIC_VECTOR(2 downto 0);
signal NA : STD_LOGIC_VECTOR(7 downto 0);

-- define the component to test
component control_memory_256_28bit port(
   IN_CAR : in STD_LOGIC_VECTOR (7 downto 0);
    MW : out STD_LOGIC;
    MM : out STD_LOGIC;
    RW : out STD_LOGIC;
    MD : out STD_LOGIC;
    FS : out STD_LOGIC_VECTOR(4 downto 0);
    MB : out STD_LOGIC;
    TB : out STD_LOGIC;
    TA : out STD_LOGIC;
    TD : out STD_LOGIC;
    PL : out STD_LOGIC;
    PI : out STD_LOGIC;
    IL : out STD_LOGIC;
    MC : out STD_LOGIC;
    MS : out STD_LOGIC_VECTOR(2 downto 0);
    NA : out STD_LOGIC_VECTOR(7 downto 0)); 
end component;

-- define a clock period long enough for the memory unit to run
constant clk_period: Time := 2 ns;

begin
-- instansiate the unit under test
uut : control_memory_256_28bit port map(
    IN_CAR => IN_CAR,
    MW => MW,
    MM => MM,
    RW => RW,
    MD => MD,
    FS => FS,
    MB => MB,
    TB => TB,
    TA => TA,
    TD => TD,
    PL => PL,
    PI => PI,
    IL => IL,
    MC => MC,
    MS => MS,
    NA => NA
);

-- begin process
stim_proc : process
begin
-- wait a few clock cycles to show that the address is undefined;
wait for clk_period;

wait for clk_period;

wait for clk_period;

wait for clk_period;

-- iterate through memory addresses and see if the outputs are as expected
wait for clk_period;
IN_CAR <= X"00";

wait for clk_period;
IN_CAR <= X"01";

wait for clk_period;
IN_CAR <= X"02";

wait for clk_period;
IN_CAR <= X"02";

wait for clk_period;
IN_CAR <= X"03";

wait for clk_period;
IN_CAR <= X"04";

wait for clk_period;
IN_CAR <= X"05";

-- if it works for these we can assume by induction that it works
-- for all addresses, just test the final edge cases

wait for clk_period;
IN_CAR <= X"FD";

wait for clk_period;
IN_CAR <= X"FE";

wait for clk_period;
IN_CAR <= X"FF";

end process;
end Test;
