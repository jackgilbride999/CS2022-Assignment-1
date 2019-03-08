library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath is
    Port ( constant_in : in STD_LOGIC_VECTOR (15 downto 0);
           MB_select : in STD_LOGIC;
           MD_select : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           write : in STD_LOGIC;
           D_address : STD_LOGIC_VECTOR(2 downto 0);
           A_address : STD_LOGIC_VECTOR(2 downto 0);
           B_address : STD_LOGIC_VECTOR(2 downto 0);
           FS : STD_LOGIC_VECTOR(4 downto 0);
           address_out : out STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC);
end datapath;

architecture Behavioral of datapath is
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

component functional_unit port(
    A : in STD_LOGIC_VECTOR (15 downto 0);
    B : in STD_LOGIC_VECTOR (15 downto 0);
    FS : in STD_LOGIC_VECTOR (4 downto 0);
    F : out STD_LOGIC_VECTOR (15 downto 0);
    V : out STD_LOGIC;
    C : out STD_LOGIC;
    N : out STD_LOGIC;
    Z : out STD_LOGIC);
end component;

component mux2_16bit port(
    in0 : in STD_LOGIC_VECTOR (15 downto 0);
    in1 : in STD_LOGIC_VECTOR (15 downto 0);
    s : in STD_LOGIC;
    Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal functional_unit_out : STD_LOGIC_VECTOR(15 downto 0);
signal muxB_out : STD_LOGIC_VECTOR(15 downto 0);
signal muxD_out : STD_LOGIC_VECTOR(15 downto 0);
signal A_data_out : STD_LOGIC_VECTOR(15 downto 0);
signal B_data_out : STD_LOGIC_VECTOR(15 downto 0);
begin

address_out <= A_data_out;
data_out <= muxB_out;

reg_file : register_file port map(
    load_enable => write,
    clk => clk,
    data => muxD_out,
    A_select => A_address,
    B_select => B_address,
    D_select => D_address,
    A_data => A_data_out,
    B_data => B_data_out
);

function_unit : functional_unit port map(
    A=>A_data_out,
    B=>muxB_out,
    FS=>FS,
    F=>functional_unit_out,
    V=>V,
    C=>C,
    N=>N,
    Z=>Z
);

muxB : mux2_16bit port map(
    in0 => B_data_out,
    in1 => constant_in,
    s => MB_select,
    Z => muxB_out
);

muxD : mux2_16bit port map(
    in0 => functional_unit_out,
    in1 => data_in,
    s => MD_select,
    Z => muxD_out
);
end Behavioral;
