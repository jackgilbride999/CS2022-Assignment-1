library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file is
    Port (  load_enable : in STD_LOGIC;
            clk : in STD_LOGIC;
            data : in STD_LOGIC_VECTOR(15 downto 0);
            A_select : in STD_LOGIC_VECTOR(3 downto 0); -- changed 28/03/19
            B_select : in STD_LOGIC_VECTOR(3 downto 0); -- changed 28/03/19
            D_select : in STD_LOGIC_VECTOR(3 downto 0); -- changed 28/03/19
            A_data : out STD_LOGIC_VECTOR(15 downto 0);
            B_data : out STD_LOGIC_VECTOR(15 downto 0));
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

-- 4 to 16 decoder
component decoder_4to16 port(
    A0: in STD_LOGIC;
    A1: in STD_LOGIC;
    A2: in STD_LOGIC;
    A3 : in STD_LOGIC;
    Q0 : out STD_LOGIC;
    Q1 : out STD_LOGIC;
    Q2 : out STD_LOGIC;
    Q3 : out STD_LOGIC;
    Q4 : out STD_LOGIC;
    Q5 : out STD_LOGIC;
    Q6 : out STD_LOGIC;
    Q7 : out STD_LOGIC;
    Q8 : out STD_LOGIC;
    Q9 : out STD_LOGIC;
    Q10 : out STD_LOGIC;
    Q11 : out STD_LOGIC;
    Q12 : out STD_LOGIC;
    Q13 : out STD_LOGIC;
    Q14 : out STD_LOGIC;
    Q15 : out STD_LOGIC);
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

-- 2 to 1 multiplexer
component mux2_16bit port(
    in0 : in STD_LOGIC_VECTOR(15 downto 0);
    in1 : in STD_LOGIC_VECTOR(15 downto 0);
    s : in STD_LOGIC;
    Z : out STD_LOGIC_VECTOR(15 downto 0));
end component;

-- SIGNALS
-- decoder outputs
signal select_r0 : STD_LOGIC;
signal select_r1 : STD_LOGIC;
signal select_r2 : STD_LOGIC;
signal select_r3 : STD_LOGIC;
signal select_r4 : STD_LOGIC;
signal select_r5 : STD_LOGIC;
signal select_r6 : STD_LOGIC;
signal select_r7 : STD_LOGIC;
signal select_r8 : STD_LOGIC; -- added 28/03/19
signal select_r9 : STD_LOGIC;
signal select_r10 : STD_LOGIC;
signal select_r11 : STD_LOGIC;
signal select_r12 : STD_LOGIC;
signal select_r13 : STD_LOGIC;
signal select_r14 : STD_LOGIC;
signal select_r15 : STD_LOGIC;

-- load registers
signal load_r0 : STD_LOGIC;
signal load_r1 : STD_LOGIC;
signal load_r2 : STD_LOGIC;
signal load_r3 : STD_LOGIC;
signal load_r4 : STD_LOGIC;
signal load_r5 : STD_LOGIC;
signal load_r6 : STD_LOGIC;
signal load_r7 : STD_LOGIC;
signal load_r8 : STD_LOGIC; -- added 28/03/19

-- register outputs
signal out_r0 : STD_LOGIC_VECTOR(15 downto 0);
signal out_r1 : STD_LOGIC_VECTOR(15 downto 0);
signal out_r2 : STD_LOGIC_VECTOR(15 downto 0);
signal out_r3 : STD_LOGIC_VECTOR(15 downto 0);
signal out_r4 : STD_LOGIC_VECTOR(15 downto 0);
signal out_r5 : STD_LOGIC_VECTOR(15 downto 0);
signal out_r6 : STD_LOGIC_VECTOR(15 downto 0);
signal out_r7 : STD_LOGIC_VECTOR(15 downto 0);
signal out_r8 : STD_LOGIC_VECTOR(15 downto 0); -- added 28/03/19

-- addtional outputs, added 28/03/19
signal muxA_out : STD_LOGIC_VECTOR(15 downto 0);
signal muxB_out : STD_LOGIC_VECTOR(15 downto 0);
begin

-- destination register selection
decoder : decoder_4to16 port map(
    A0 => D_select(3),
    A1 => D_select(2),
    A2 => D_select(1),
    A3 => D_select(0),
    Q0 => select_r0,
    Q1 => select_r1,
    Q2 => select_r2,
    Q3 => select_r3,
    Q4 => select_r4,
    Q5 => select_r5,
    Q6 => select_r6,
    Q7 => select_r7,
    Q8 => select_r8,
    Q9 => select_r9,
    Q10 => select_r10,
    Q11 => select_r11,
    Q12 => select_r12,
    Q13 => select_r13,
    Q14 => select_r14,
    Q15 => select_r15);
    
-- destination register selection AND load signal
load_r0 <= select_r0 and load_enable;
load_r1 <= select_r1 and load_enable;
load_r2 <= select_r2 and load_enable;
load_r3 <= select_r3 and load_enable;
load_r4 <= select_r4 and load_enable;
load_r5 <= select_r5 and load_enable;
load_r6 <= select_r6 and load_enable;
load_r7 <= select_r7 and load_enable;
load_r8 <= (select_r8 or select_r9 or select_r10 or select_r11 or select_r12 or select_r13 or select_r14 or select_r15) and load_enable; -- added 29/03/19

-- register 0
reg0 : reg16 port map(
    D => data,
    load => load_r0,
    clk => clk,
    Q => out_r0);

-- register 1
reg1 : reg16 port map(
    D => data,
    load => load_r1,
    clk => clk,
    Q => out_r1);
    
-- register 2
reg2 : reg16 port map(
    D => data,
    load => load_r2,
    clk => clk,
    Q => out_r2);
    
-- register 3
reg3 : reg16 port map(
    D => data,
    load => load_r3,
    clk => clk,
    Q => out_r3);
    
-- register 4
reg4 : reg16 port map(
    D => data,
    load => load_r4,
    clk => clk,
    Q => out_r4); 
    
-- register 5
reg5 : reg16 port map(
    D => data,
    load => load_r5,
    clk => clk,
    Q => out_r5);

-- register 6
reg6: reg16 port map(
    D => data,
    load => load_r6,
    clk => clk,
    Q => out_r6);
    
-- register 7
reg7 : reg16 port map(
    D => data,
    load => load_r7,
    clk => clk,
    Q => out_r7);

-- temp register, added 29/03/19
reg8: reg16 port map(
    D=> data,
    load => load_r8,
    clk => clk,
    Q => out_r8);
        
-- select source address A
muxA : mux8_16bit port map(
    in0 => out_r0,
    in1 => out_r1,
    in2 => out_r2,
    in3 => out_r3,
    in4 => out_r4,
    in5 => out_r5,
    in6 => out_r6,
    in7 => out_r7,
    s0 => A_select(2),
    s1 => A_select(1),
    s2 => A_select(0),
    Z => muxA_out);
    
-- select source address B
muxB : mux8_16bit port map(
    in0 => out_r0,
    in1 => out_r1,
    in2 => out_r2,
    in3 => out_r3,
    in4 => out_r4,
    in5 => out_r5,
    in6 => out_r6,
    in7 => out_r7,
    s0 => B_select(2),
    s1 => B_select(1),
    s2 => B_select(0),
    Z => muxB_out);
    
-- added 28/03/19 - decide between output of R8 and muxA
mux2A : mux2_16bit port map(
    in0 => muxA_out,
    in1 => out_r8,
    s => A_select(3),
    Z => A_data
);

-- added 28/03/19 - decide between output of R8 and muxB
mux2B : mux2_16bit port map(
    in0 => muxB_out,
    in1 => out_r8,
    s => B_select(3),
    Z => B_data
);
end Behavioral;
