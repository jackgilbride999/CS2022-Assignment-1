library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder_16bit is
    Port ( X : in STD_LOGIC_VECTOR (15 downto 0);
           Y : in STD_LOGIC_VECTOR (15 downto 0);
           c_in : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0);
           c_out : out STD_LOGIC;
           V : out STD_LOGIC);
end ripple_adder_16bit;

architecture Behavioral of ripple_adder_16bit is
-- full adder bitslice
component full_adder port(
          in0 : in STD_LOGIC;
          in1 : in STD_LOGIC;
          c_in : in STD_LOGIC;
          sum : out STD_LOGIC;
          c_out : out STD_LOGIC);
end component;

-- SIGNALS --
signal c0 : STD_LOGIC;
signal c1 : STD_LOGIC;
signal c2 : STD_LOGIC;
signal c3 : STD_LOGIC;
signal c4 : STD_LOGIC;
signal c5 : STD_LOGIC;
signal c6 : STD_LOGIC;
signal c7 : STD_LOGIC;
signal c8 : STD_LOGIC;
signal c9 : STD_LOGIC;
signal c10 : STD_LOGIC;
signal c11 : STD_LOGIC;
signal c12 : STD_LOGIC;
signal c13 : STD_LOGIC;
signal c14 : STD_LOGIC;
signal c15 : STD_LOGIC;

begin
adder0: full_adder port map(
 in0 => X(0),
 in1 => Y(0),
 c_in => c_in,
 sum => G(0),
 c_out => c0
);

adder1: full_adder port map(
 in0 => X(1),
 in1 => Y(1),
 c_in => c0,
 sum => G(1),
 c_out => c1
);

adder2: full_adder port map(
 in0 => X(2),
 in1 => Y(2),
 c_in => c1,
 sum => G(2),
 c_out => c2
);

adder3: full_adder port map(
 in0 => X(3),
 in1 => Y(3),
 c_in => c2,
 sum => G(3),
 c_out => c3
);

adder4: full_adder port map(
 in0 => X(4),
 in1 => Y(4),
 c_in => c3,
 sum => G(4),
 c_out => c4
);

adder5: full_adder port map(
 in0 => X(5),
 in1 => Y(5),
 c_in => c4,
 sum => G(5),
 c_out => c5
);

adder6: full_adder port map(
 in0 => X(6),
 in1 => Y(6),
 c_in => c5,
 sum => G(6),
 c_out => c6
);

adder7: full_adder port map(
 in0 => X(7),
 in1 => Y(7),
 c_in => c6,
 sum => G(7),
 c_out => c7
);

adder8: full_adder port map(
 in0 => X(8),
 in1 => Y(8),
 c_in => c7,
 sum => G(8),
 c_out => c8
);

adder9: full_adder port map(
 in0 => X(9),
 in1 => Y(9),
 c_in => c8,
 sum => G(9),
 c_out => c9
);

adder10: full_adder port map(
 in0 => X(10),
 in1 => Y(10),
 c_in => c9,
 sum => G(10),
 c_out => c10
);

adder11: full_adder port map(
 in0 => X(11),
 in1 => Y(11),
 c_in => c10,
 sum => G(11),
 c_out => c11
);

adder12: full_adder port map(
 in0 => X(12),
 in1 => Y(12),
 c_in => c11,
 sum => G(12),
 c_out => c12
);

adder13: full_adder port map(
 in0 => X(13),
 in1 => Y(13),
 c_in => c12,
 sum => G(13),
 c_out => c13
);

adder14: full_adder port map(
 in0 => X(14),
 in1 => Y(14),
 c_in => c13,
 sum => G(14),
 c_out => c14
);

adder15: full_adder port map(
 in0 => X(15),
 in1 => Y(15),
 c_in => c14,
 sum => G(15),
 c_out => c15
);

c_out <= c15;
V <= c14 xor c15;
end Behavioral;
