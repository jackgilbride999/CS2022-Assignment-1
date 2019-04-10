library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Purpose of this testbench; to test the overall implementation of the system. 
-- Keep the microprocessor and memory as seperate components. This is fine as
-- memory would not usually be on the chip itself.
-- Define signals to attach to the inputs and outputs of the microprocessor and
-- memory module. This way we can load values into memory at the start with testing,
-- without having to worry about the CPU.
-- Then load the first instruction in memory into the microprocessor. After a suitable
-- number of clock cycles load in the next instruction. Note the output signals of the
-- microprocessor and ensure that these are as expected. This is much like connecting
-- memory directly to the microprocessor and letting it run, but this way we can view 
-- the inputs/outputs of each module and ensure that they are as expected.
-- In essence we explicitly simulate the functionality of the microprocessor while
-- watching its interactions with memory.
entity microprocessor_8reg_16bit_tb is
end microprocessor_8reg_16bit_tb;

architecture Test of microprocessor_8reg_16bit_tb is

-- define the components to test
component microprocessor_8reg_16bit port(
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    instruction_in : in STD_LOGIC_VECTOR(15 downto 0);
    data_in : in STD_LOGIC_VECTOR (15 downto 0);
    MW : out STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR (15 downto 0);
    address_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component memory_512_16bit port(
    data_in : in STD_LOGIC_VECTOR (15 downto 0);
    address : in STD_LOGIC_VECTOR (15 downto 0);
    MW : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- define signals for us to drive individual inputs/view individual outputs
signal cpu_reset : STD_LOGIC;
signal cpu_clk : STD_LOGIC;
signal cpu_instruction_in : STD_LOGIC_VECTOR(15 downto 0);
signal cpu_data_in : STD_LOGIC_VECTOR(15 downto 0);
signal cpu_MW : STD_LOGIC;
signal cpu_data_out : STD_LOGIC_VECTOR(15 downto 0); 
signal cpu_address_out : STD_LOGIC_VECTOR(15 downto 0);
signal mem_data_in : STD_LOGIC_VECTOR(15 downto 0);
signal mem_address : STD_LOGIC_VECTOR(15 downto 0);
signal mem_MW : STD_LOGIC;
signal mem_data_out : STD_LOGIC_VECTOR(15 downto 0);

begin
microprocessor : microprocessor_8reg_16bit port map(
    reset => cpu_reset,
    clk => cpu_clk,
    instruction_in => cpu_instruction_in,
    data_in => cpu_data_in,
    MW => cpu_MW,
    data_out => cpu_data_out,
    address_out => cpu_address_out);
    
mem : memory_512_16bit port map(
    data_in => mem_data_in,
    address => mem_address,
    MW => mem_MW,
    data_out => mem_data_out);
    
stim_proc : process
begin
-- TODO: Write process (pseudocode below)
-- load multiple instructions into memory by driving mem_data_in, mem_address and mem_MW
-- assign cpu_instruction_in and cpu_data_in to mem_data_out 
-- assign mem_data_in to cpu_data_out and mem_address to cpu_address_out
-- assign cpu_MW to mem_MW
-- set
-- drive clock
-- when clock HIGH, clear reset
-- continue to drive clock
-- observe signals between cpu and memory; they should be as expected based on the instructions loaded in ath the beginning
end process;
end Test;
