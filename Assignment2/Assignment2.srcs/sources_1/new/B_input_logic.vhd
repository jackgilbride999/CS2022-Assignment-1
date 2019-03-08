library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity B_input_logic is
    Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end B_input_logic;

architecture Behavioral of B_input_logic is
component mux2_1bit port(
          in0 : in STD_LOGIC;
          in1 : in STD_LOGIC;
          s : in STD_LOGIC;
          Z : out STD_LOGIC);
end component;
begin
mux0: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(0),
 Z => Y(0)
);

mux1: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(1),
 Z => Y(1)
);

mux2: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(2),
 Z => Y(2)
);

mux3: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(3),
 Z => Y(3)
);

mux4: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(4),
 Z => Y(4)
);

mux5: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(5),
 Z => Y(5)
);

mux6: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(6),
 Z => Y(6)
);

mux7: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(7),
 Z => Y(7)
);

mux8: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(8),
 Z => Y(8)
);

mux9: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(9),
 Z => Y(9)
);

mux10: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(10),
 Z => Y(10)
);

mux11: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(11),
 Z => Y(11)
);

mux12: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(12),
 Z => Y(12)
);

mux13: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(13),
 Z => Y(13)
);

mux14: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(14),
 Z => Y(14)
);

mux15: mux2_1bit port map(
 in0 => s0,
 in1 => s1,
 s => B(15),
 Z => Y(15)
);
end Behavioral;
