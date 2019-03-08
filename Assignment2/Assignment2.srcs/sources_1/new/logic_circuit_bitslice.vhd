library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_circuit_bitslice is
    Port ( s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           Ai : in STD_LOGIC;
           Bi : in STD_LOGIC;
           Gi : out STD_LOGIC);
end logic_circuit_bitslice;

architecture Behavioral of logic_circuit_bitslice is
-- 4 to 1 line multiplexer
component mux4_1bit port(
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           in3 : in STD_LOGIC;
           out0 : out STD_LOGIC);
end component;

-- SIGNALS
signal A_and_B : STD_LOGIC;
signal A_or_B : STD_LOGIC;
signal A_xor_B : STD_LOGIC;
signal not_A : STD_LOGIC;

begin
-- Signal Assignments
A_and_B <= Ai and Bi;
A_or_B <= Ai or Bi;
A_xor_B <= Ai or Bi;
not_A <= not Ai;

-- PORT MAP
mux: mux4_1bit port map(
    s0 => s0,
    s1 => s1,
    in0 => A_and_B,
    in1 => A_or_B,
    in2 => A_xor_B,
    in3 => not_A,
    out0 => Gi
 );

end Behavioral;
