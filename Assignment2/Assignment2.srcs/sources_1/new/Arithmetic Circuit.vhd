library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_circuit is
    Port ( c_in : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0);
           c_out : out STD_LOGIC);
end arithmetic_circuit;

architecture Behavioral of arithmetic_circuit is
component B_input_logic port(
          B : in STD_LOGIC_VECTOR (15 downto 0);
          s0 : in STD_LOGIC;
          s1 : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component ripple_adder_16bit port( 
           X : in STD_LOGIC_VECTOR (15 downto 0);
           Y : in STD_LOGIC_VECTOR (15 downto 0);
           c_in : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0);
           c_out : out STD_LOGIC);
end component;

signal Y : STD_LOGIC_VECTOR (15 downto 0);
begin
B_logic: B_input_logic port map(
 B => B,
 s0 => s0,
 s1 => s1,
 Y => Y
);

adder: ripple_adder_16bit port map(
 X => A,
 Y => Y,
 c_in => c_in,
 G => G, 
 c_out => c_out
 );


end Behavioral;
