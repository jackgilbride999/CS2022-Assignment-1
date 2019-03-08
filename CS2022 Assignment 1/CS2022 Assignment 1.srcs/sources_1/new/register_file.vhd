library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file is
    Port ( src_s0 : in STD_LOGIC;
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
end register_file;

architecture Behavioral of register_file is
----- COMPONENTS -----
-- 16-bit register
component reg16 port(
    D: in STD_LOGIC_VECTOR(15 downto 0);
    load : in STD_LOGIC;
    clk : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR(15 downto 0));
end component;

-- 3 to 8 decoder
component decoder_3to8 port(
    A0: in STD_LOGIC;
    A1: in STD_LOGIC;
    A2: in STD_LOGIC;
    Q0 : out STD_LOGIC;
    Q1 : out STD_LOGIC;
    Q2 : out STD_LOGIC;
    Q3 : out STD_LOGIC;
    Q4 : out STD_LOGIC;
    Q5 : out STD_LOGIC;
    Q6 : out STD_LOGIC;
    Q7 : out STD_LOGIC);
end component;


-- 2 to 1 line multiplexer
component mux2_16bit port(
    in0 : in STD_LOGIC_VECTOR(15 downto 0);
    in1 : in STD_LOGIC_VECTOR(15 downto 0);
    s : in STD_LOGIC;
    Z : out STD_LOGIC_VECTOR(15 downto 0));
end component;

-- 8 to 1 line multiplexer
component mux8_16bit port(
    in0 : in STD_LOGIC_VECTOR(15 downto 0);
    in1 : in STD_LOGIC_VECTOR(15 downto 0);
    in2 : in STD_LOGIC_VECTOR(15 downto 0);
    in3 : in STD_LOGIC_VECTOR(15 downto 0);
    in4 : in STD_LOGIC_VECTOR(15 downto 0);
    in5 : in STD_LOGIC_VECTOR(15 downto 0);
    in6 : in STD_LOGIC_VECTOR(15 downto 0);
    in7 : in STD_LOGIC_VECTOR(15 downto 0);
    s0  : in STD_LOGIC;
    s1  : in STD_LOGIC;
    s2  : in STD_LOGIC;
    Z   : out STD_LOGIC_VECTOR(15 downto 0));
end component;

----- SIGNALS -----
signal load_reg0 : STD_LOGIC;
signal load_reg1 : STD_LOGIC;
signal load_reg2 : STD_LOGIC;
signal load_reg3 : STD_LOGIC;
signal load_reg4 : STD_LOGIC;
signal load_reg5 : STD_LOGIC;
signal load_reg6 : STD_LOGIC;
signal load_reg7 : STD_LOGIC;

signal reg0_q : STD_LOGIC_VECTOR(15 downto 0);
signal reg1_q : STD_LOGIC_VECTOR(15 downto 0);
signal reg2_q : STD_LOGIC_VECTOR(15 downto 0);
signal reg3_q : STD_LOGIC_VECTOR(15 downto 0);
signal reg4_q : STD_LOGIC_VECTOR(15 downto 0);
signal reg5_q : STD_LOGIC_VECTOR(15 downto 0);
signal reg6_q : STD_LOGIC_VECTOR(15 downto 0);
signal reg7_q : STD_LOGIC_VECTOR(15 downto 0);

signal data_src_mux_out : STD_LOGIC_VECTOR(15 downto 0);
signal src_reg : STD_LOGIC_VECTOR(15 downto 0);

begin
----- PORT MAPS -----
-- register 0
reg00: reg16 port map(
    D => data_src_mux_out,
    load => load_reg0,
    clk => clk,
    Q => reg0_q);
    
-- register 1
reg01: reg16 port map(
    D => data_src_mux_out,
    load => load_reg1,  
    clk => clk,
    Q => reg1_q);
    
-- register 2
reg02: reg16 port map(
    D => data_src_mux_out,
    load => load_reg2,
    clk => clk,
    Q => reg2_q);
    
-- register 3
reg03: reg16 port map(
    D => data_src_mux_out,
    load => load_reg3,
    clk => clk,
    Q => reg3_q);

-- register 4
reg04: reg16 port map(
    D => data_src_mux_out,
    load => load_reg4,
    clk => clk,
    Q => reg4_q);
    
-- register 5
reg05: reg16 port map(
    D => data_src_mux_out,
    load => load_reg5,
    clk => clk,
    Q => reg5_q);
    
-- register 6
reg06: reg16 port map(
    D => data_src_mux_out,
    load => load_reg6,
    clk => clk,
    Q => reg6_q);
    
-- register 7
reg07: reg16 port map(
    D => data_src_mux_out,
    load => load_reg7,
    clk => clk,
    Q => reg7_q);
    
-- destination register decoder
des_decoder_3to8: decoder_3to8 port map(
    A0 => des_A0,
    A1 => des_A1,
    A2 => des_A2,
    Q0 => load_reg0,
    Q1 => load_reg1,
    Q2 => load_reg2,
    Q3 => load_reg3,
    Q4 => load_reg4,
    Q5 => load_reg5,
    Q6 => load_reg6,
    Q7 => load_reg7);

-- 2 to 1 data source multiplexer    
data_src_mux2_16bit: mux2_16bit port map(
    in0 => data,
    in1 => src_reg,
    s => data_src,
    Z => data_src_mux_out);

-- 8 to 1 source register multiplexer
inst_mux8_16bit: mux8_16bit port map(
    in0 => reg0_q,
    in1 => reg1_q,
    in2 => reg2_q,
    in3 => reg3_q,
    in4 => reg4_q,
    in5 => reg5_q,
    in6 => reg6_q,
    in7 => reg7_q,
    s0 => src_s0,
    s1 => src_s1,
    s2 => src_s2,
    Z => src_reg);
    
-- Map the values in registers to outputs
-- of the register file
reg0 <= reg0_q;
reg1 <= reg1_q;
reg2 <= reg2_q;
reg3 <= reg3_q;
reg4 <= reg4_q;
reg5 <= reg5_q;
reg6 <= reg6_q;
reg7 <= reg7_q;
    
end Behavioral;
