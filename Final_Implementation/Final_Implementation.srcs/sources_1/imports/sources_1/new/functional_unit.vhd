library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity functional_unit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           F : out STD_LOGIC_VECTOR (15 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC);
end functional_unit;

architecture Behavioral of functional_unit is
--- COMPONENTS ---
-- ALU
component alu_16bit port(
    A : in STD_LOGIC_VECTOR (15 downto 0);
    B : in STD_LOGIC_VECTOR (15 downto 0);
    s0 : in STD_LOGIC;
    s1 : in STD_LOGIC;
    s2 : in STD_LOGIC;
    c_in : in STD_LOGIC;
    c_out : out STD_LOGIC;
    G : out STD_LOGIC_VECTOR (15 downto 0);
    V : out STD_LOGIC);
end component;

-- Shifter
component shifter_unit port(
    B : in STD_LOGIC_VECTOR (15 downto 0);
    S : in STD_LOGIC_VECTOR (1 downto 0);
    IR : in STD_LOGIC;
    IL : in STD_LOGIC;
    H : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- Zero Detector
component zero_detector_16bit port(
    G : in STD_LOGIC_VECTOR (15 downto 0);
    Z : out STD_LOGIC);
end component;

-- 2 to 1 Mux, 16 bit
component mux2_16bit port(
    in0 : in STD_LOGIC_VECTOR (15 downto 0);
    in1 : in STD_LOGIC_VECTOR (15 downto 0);
    s : in STD_LOGIC;
    Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--- SIGNALS ---
signal alu_out : STD_LOGIC_VECTOR (15 downto 0);
signal shifter_out : STD_LOGIC_VECTOR (15 downto 0);
begin
-- ALU
alu : alu_16bit port map(
    A=>A,
    B=>B,
    s0=>FS(1),
    s1=>FS(2),
    s2=>FS(3),
    c_in=>FS(0),
    c_out=>C,
    G=>alu_out,
    V => V);

-- Shifter
shifter : shifter_unit port map(
    B=>B,
    S(0)=>FS(1),
    S(1)=>FS(2),
    IR=>'0',
    IL=>'0',
    H=>shifter_out);

-- Mux F
muxF : mux2_16bit port map(
    in0=>alu_out,
    in1=>shifter_out,
    s=>FS(4),
    Z=>F);

-- Zero Detector
zero_detect : zero_detector_16bit port map(
    G => alu_out,
    Z => Z);
    
-- Negative flag
N<=alu_out(15);
end Behavioral;
