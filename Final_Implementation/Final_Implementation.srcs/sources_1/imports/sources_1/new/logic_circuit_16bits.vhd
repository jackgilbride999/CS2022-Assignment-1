library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_circuit_16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0));
end logic_circuit_16bits;

architecture Behavioral of logic_circuit_16bits is
component logic_circuit_bitslice port( 
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           Ai : in STD_LOGIC;
           Bi : in STD_LOGIC;
           Gi : out STD_LOGIC);
end component;
begin
bitslice0: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(0),
 Bi => B(0),
 Gi => G(0)
);
bitslice1: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(1),
 Bi => B(1),
 Gi => G(1)
);
bitslice2: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(2),
 Bi => B(2),
 Gi => G(2)
);
bitslice3: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(3),
 Bi => B(3),
 Gi => G(3)
);
bitslice4: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(4),
 Bi => B(4),
 Gi => G(4)
);
bitslice5: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(5),
 Bi => B(5),
 Gi => G(5)
);
bitslice6: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(6),
 Bi => B(6),
 Gi => G(6)
);
bitslice7: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(7),
 Bi => B(7),
 Gi => G(7)
);
bitslice8: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(8),
 Bi => B(8),
 Gi => G(8)
);
bitslice9: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(9),
 Bi => B(9),
 Gi => G(9)
);
bitslice10: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(10),
 Bi => B(10),
 Gi => G(10)
);
bitslice11: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(11),
 Bi => B(11),
 Gi => G(11)
);
bitslice12: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(12),
 Bi => B(12),
 Gi => G(12)
);
bitslice13: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(13),
 Bi => B(13),
 Gi => G(13)
);
bitslice14: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(14),
 Bi => B(14),
 Gi => G(14)
);
bitslice15: logic_circuit_bitslice port map(
 s0 => s0,
 s1 => s1,
 Ai => A(15),
 Bi => B(15),
 Gi => G(15)
);

end Behavioral;
