library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_file_tb is
end reg_file_tb;

architecture Test of reg_file_tb is
-- Component Declaration for the Unit Under Test (UUT)
component register_file is
    Port (src_s0 : in STD_LOGIC;
           src_s1 : in STD_LOGIC;
           src_s2 : in STD_LOGIC;
           des_A0 : in STD_LOGIC;
           des_A1 : in STD_LOGIC;
           des_A2 : in STD_LOGIC;
           clk : in STD_LOGIC;
           data_src : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (15 downto 0);
           reg0 : out STD_LOGIC_VECTOR (15 downto 0);
           reg1 : out STD_LOGIC_VECTOR (15 downto 0);
           reg2 : out STD_LOGIC_VECTOR (15 downto 0);
           reg3 : out STD_LOGIC_VECTOR (15 downto 0);
           reg4 : out STD_LOGIC_VECTOR (15 downto 0);
           reg5 : out STD_LOGIC_VECTOR (15 downto 0);
           reg6 : out STD_LOGIC_VECTOR (15 downto 0);
           reg7 : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- INPUTS --
signal src_s0 : STD_LOGIC;
signal src_s1 : STD_LOGIC;
signal src_s2 : STD_LOGIC;
signal des_A0 : STD_LOGIC;
signal des_A1 : STD_LOGIC;
signal des_A2 : STD_LOGIC;
signal clk : STD_LOGIC;
signal data_src : STD_LOGIC;
signal data : STD_LOGIC_VECTOR (15 downto 0);

-- OUTPUTS --
signal reg0 : STD_LOGIC_VECTOR (15 downto 0);
signal reg1 : STD_LOGIC_VECTOR (15 downto 0);
signal reg2 : STD_LOGIC_VECTOR (15 downto 0);
signal reg3 : STD_LOGIC_VECTOR (15 downto 0);
signal reg4 : STD_LOGIC_VECTOR (15 downto 0);
signal reg5 : STD_LOGIC_VECTOR (15 downto 0);
signal reg6 : STD_LOGIC_VECTOR (15 downto 0);
signal reg7 : STD_LOGIC_VECTOR (15 downto 0);

--CLOCK
constant clk_period : time := 20 ns;

begin
-- Instansiate the Unit Under Test (UUT)
uut: register_file port map (
    src_s0 => src_s0,
    src_s1 => src_s1,
    src_s2 => src_s2,
    des_A0 => des_A0,
    des_A1 => des_A1,
    des_A2 => des_A2,
    clk => clk,
    data_src => data_src,
    data => data,
    reg0 => reg0,
    reg1 => reg1,
    reg2 => reg2,
    reg3 => reg3,
    reg4 => reg4,
    reg5 => reg5,
    reg6 => reg6,
    reg7 => reg7
);

stim_proc: process
begin
-- Initialise some inputs
data_src <= '0';
data <= x"ABCD";

-- Rising edge
wait for clk_period;
clk <= '1';

-- a) CORRECTLY LOAD AN ARBITRARY HEX VALUE --
--    INTO EACH OF THE EIGHT REGISTERS --

-- Falling edge
wait for clk_period;
clk <= '0';
des_A0 <= '0';
des_A1 <= '0';
des_A2 <= '0';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';
des_A0 <= '0';
des_A1 <= '0';
des_A2 <= '1';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';
des_A0 <= '0';
des_A1 <= '1';
des_A2 <= '0';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';
des_A0 <= '0';
des_A1 <= '1';
des_A2 <= '1';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';
des_A0 <= '1';
des_A1 <= '0';
des_A2 <= '0';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';
des_A0 <= '1';
des_A1 <= '0';
des_A2 <= '1';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';
des_A0 <= '1';
des_A1 <= '1';
des_A2 <= '0';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';
des_A0 <= '1';
des_A1 <= '1';
des_A2 <= '1';

-- Rising edge
wait for clk_period;
clk <= '1';

-- b) CORRECTLY TRANSFER THE CONTENTS OF  --
--    ANY REGISTER INTO ANY OTHER REGISTER --

-- Falling edge
-- Load new value into R0 for register transfer
wait for clk_period;
clk <= '0';
data <= x"FFFF";
des_A0 <= '0';
des_A1 <= '0';
des_A2 <= '0';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';
-- Select the appropriate values for register transfer R0->R7
data_src <= '1';
src_s0 <= '0';
src_s1 <= '0';
src_s2 <= '0';
des_A0 <= '1';
des_A1 <= '1';
des_A2 <= '1';
-- ensure that the transfer is definitely from R0
data <= x"0000";

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';

-- Rising edge
wait for clk_period;
clk <= '1';

-- Falling edge
wait for clk_period;
clk <= '0';
end process;
end Test;