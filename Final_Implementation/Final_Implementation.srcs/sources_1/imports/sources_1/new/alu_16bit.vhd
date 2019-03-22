library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_16bit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           s2 : in STD_LOGIC;
           c_in : in STD_LOGIC;
           c_out : out STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0);
           V : out STD_LOGIC);
end alu_16bit;

architecture Behavioral of alu_16bit is
component logic_circuit_16bits port(
      A : in STD_LOGIC_VECTOR (15 downto 0);
      B : in STD_LOGIC_VECTOR (15 downto 0);
      s0 : in STD_LOGIC;
      s1 : in STD_LOGIC;
      G : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component arithmetic_circuit port(
       c_in : in STD_LOGIC;
       A : in STD_LOGIC_VECTOR (15 downto 0);
       B : in STD_LOGIC_VECTOR (15 downto 0);
       s0 : in STD_LOGIC;
       s1 : in STD_LOGIC;
       G : out STD_LOGIC_VECTOR (15 downto 0);
       c_out : out STD_LOGIC;
       V : out STD_LOGIC);
end component;

component mux2_16bit port(
    in0 : in STD_LOGIC_VECTOR (15 downto 0);
    in1 : in STD_LOGIC_VECTOR (15 downto 0);
    s : in STD_LOGIC;
    Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;
signal arithmetic_G : STD_LOGIC_VECTOR(15 downto 0);
signal logical_G : STD_LOGIC_VECTOR(15 downto 0);

begin
mux: mux2_16bit port map(
   in0 => arithmetic_G,
   in1 => logical_G,
   s => s2,
   Z => G
);

-- note: the arithmetic circuit and lower layers were
-- written with s0 set where s1 should be set and vice 
-- versa. Quick fix: Use the port map to fix this without
-- having to rewrite lower layers and re-test
-- this solution works fine as alu_16_bit_tb works as 
-- expected
arithmetic_unit: arithmetic_circuit port map(
   c_in => c_in,
   A => A,
   B =>B,
   s0 =>s1,
   s1 =>s0,
   G => arithmetic_G,
   c_out => c_out,
   V => V
);
logic_unit: logic_circuit_16bits port map(
  A => A,
  B => B,
  s0 => s0,
  s1 => s1,
  G => logical_G
);

end Behavioral;
