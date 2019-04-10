library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity microprocessor_8reg_16bit is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           instruction_in : in STD_LOGIC_VECTOR(15 downto 0);
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           MW : out STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           address_out : out STD_LOGIC_VECTOR (15 downto 0));
end microprocessor_8reg_16bit;

architecture Behavioral of microprocessor_8reg_16bit is
component datapath Port(
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

component mux2_16bit Port(
    in0 : in STD_LOGIC_VECTOR (15 downto 0);
    in1 : in STD_LOGIC_VECTOR (15 downto 0);
    s : in STD_LOGIC;
    Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component zero_fill_3to16 Port(
    in_3bits : in STD_LOGIC_VECTOR(2 downto 0);
    out_16bits : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component sign_extend_6to16 Port ( 
    in_6bits : in STD_LOGIC_VECTOR(5 downto 0);
   out_16bits : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component program_counter Port(
    address : in STD_LOGIC_VECTOR (15 downto 0);
    PL : in STD_LOGIC;
    PI : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    PC_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component mux8_1bit Port(
    in0 : in STD_LOGIC;
    in1 : in STD_LOGIC;
    in2 : in STD_LOGIC;
    in3 : in STD_LOGIC;
    in4 : in STD_LOGIC;
    in5 : in STD_LOGIC;
    in6 : in STD_LOGIC;
    in7 : in STD_LOGIC;
    s0 : in STD_LOGIC;
    s1 : in STD_LOGIC;
    s2 : in STD_LOGIC;
    Z : out STD_LOGIC);
end component;

component instruction_register_16bits Port(
    instruction_in : in STD_LOGIC_VECTOR (15 downto 0);
    IL : in STD_LOGIC;
    clk : in STD_LOGIC;
    opcode : out STD_LOGIC_VECTOR (6 downto 0);
    DR : out STD_LOGIC_VECTOR (2 downto 0);
    SA : out STD_LOGIC_VECTOR (2 downto 0);
    SB : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component mux2_8bit Port(
    in0 : in STD_LOGIC_VECTOR (7 downto 0);
    in1 : in STD_LOGIC_VECTOR (7 downto 0);
    s : in STD_LOGIC;
    Z : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component control_address_register_8bit Port(
    in_address : in STD_LOGIC_VECTOR (7 downto 0);
    load_address : in STD_LOGIC;
    clk : in STD_LOGIC;
    address_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component control_memory_256_28bit Port(
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

-- control memory output signals
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
signal MS : STD_LOGIC_VECTOR (2 downto 0);
signal NA : STD_LOGIC_VECTOR(7 downto 0);

signal CAR_out : STD_LOGIC_VECTOR(7 downto 0);
signal muxc_out : STD_LOGIC_VECTOR(7 downto 0);
signal opcode : STD_LOGIC_VECTOR(6 downto 0);
signal DR : STD_LOGIC_VECTOR(2 downto 0);
signal SA : STD_LOGIC_VECTOR(2 downto 0);
signal SB : STD_LOGIC_VECTOR(2 downto 0);
signal muxs_out : STD_LOGIC;
signal muxm_out : STD_LOGIC_VECTOR(15 downto 0);
signal zero_fill_out : STD_LOGIC_VECTOR(15 downto 0);
signal sign_extend_out : STD_LOGIC_VECTOR(15 downto 0);
signal pc_out : STD_LOGIC_VECTOR(15 downto 0);

signal V : STD_LOGIC;
signal C : STD_LOGIC;
signal N : STD_LOGIC;
signal Z : STD_LOGIC;
signal notC : STD_LOGIC;
signal notZ : STD_LOGIC;

begin
control_mem : control_memory_256_28bit port map(
    IN_CAR => CAR_out,
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
    NA => NA);
    
CAR : control_address_register_8bit port map(
    in_address => muxc_out,
    load_address => muxs_out,
    clk => clk,
    address_out => CAR_out);
    
muxC : mux2_8bit port map(
    in0 => NA,
    in1(7) => '0',
    in1(6 downto 0) => opcode,
    s => mc,
    Z => muxc_out);
    
IR : instruction_register_16bits port map(
    instruction_in => instruction_in,
    IL => IL,
    clk => clk,
    opcode => opcode,
    DR => DR,
    SA => SA,
    SB => SB);

notC <= not C;
notZ <= not Z;

muxS : mux8_1bit port map(
    in0 => '0',
    in1 => '1',
    in2 => C,
    in3 => V,
    in4 => Z,
    in5 => N,
    in6 => notC,
    in7 => notZ,
    s0 => MS(0),
    s1 => MS (1),
    s2 => MS (2),
    Z => muxS_out);
    
zero_fill : zero_fill_3to16 port map(
    in_3bits => SB,
    out_16bits => zero_fill_out);

pc : program_counter port map(
    address => sign_extend_out,
    PL => PL,
    PI => PI,
    clk => clk,
    reset => reset,
    PC_out => pc_out);

sign_extend : sign_extend_6to16 port map(
    in_6bits(5 downto 3) => DR,
    in_6bits(2 downto 0) => SB,
    out_16bits => sign_extend_out);
    
datapath16bit : datapath port map(
    constant_in =>zero_fill_out,
    MB_select => MB,
    MD_select => MD,
    data_in => data_in,
    clk => clk,
    write => RW,
    D_address(3) => TD,
    D_address(2 downto 0) => DR,
    A_address(3) => TA,
    A_address(2 downto 0) => SA,
    B_address(3) => TB,
    B_address(2 downto 0) => SB,
    FS => FS,
    address_out => address_out,
    data_out => data_out,
    V => V,
    C => C,
    N => N,
    Z => Z);
    
end Behavioral;
