library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_unit is
    Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           IR : in STD_LOGIC;
           IL : in STD_LOGIC;
           H : out STD_LOGIC_VECTOR (15 downto 0));
end shifter_unit;

architecture Behavioral of shifter_unit is
component mux3_1bit port(
      in0 : in STD_LOGIC;
      in1 : in STD_LOGIC;
      in2 : in STD_LOGIC;
      s : in STD_LOGIC_VECTOR (1 downto 0);
      z : out STD_LOGIC);
end component;
begin
mux0 : mux3_1bit port map(
    in0 => B(0),
    in1 => B(1),
    in2 => IL,
    s => s,
    z => H(0));
    
mux1 : mux3_1bit port map(
    in0 => B(1),
    in1 => B(2),
    in2 => B(0),
    s => s,
    z => H(1));
    
mux2 : mux3_1bit port map(
    in0 => B(2),
    in1 => B(3),
    in2 => B(1),
    s => s,
    z => H(2));

mux3 : mux3_1bit port map(
    in0 => B(3),
    in1 => B(4),
    in2 => B(2),
    s => s,
    z => H(3));    
    
mux4 : mux3_1bit port map(
    in0 => B(4),
    in1 => B(5),
    in2 => B(3),
    s => s,
    z => H(4));
        
mux5 : mux3_1bit port map(
    in0 => B(5),
    in1 => B(6),
    in2 => B(4),
    s => s,
    z => H(5));
       
mux6 : mux3_1bit port map(
    in0 => B(6),
    in1 => B(7),
    in2 => B(5),
    s => s,
    z => H(6));
       
mux7 : mux3_1bit port map(
    in0 => B(7),
    in1 => B(8),
    in2 => B(6),
    s => s,
    z => H(7));        
    
 mux8 : mux3_1bit port map(
    in0 => B(8),
    in1 => B(9),
    in2 => B(7),
    s => s,
    z => H(8));   
    
mux9 : mux3_1bit port map(
    in0 => B(9),
    in1 => B(10),
    in2 => B(8),
    s => s,
    z => H(9));
    
mux10 : mux3_1bit port map(
    in0 => B(10),
    in1 => B(11),
    in2 => B(9),
    s => s,
    z => H(10));
        
mux11 : mux3_1bit port map(
    in0 => B(11),
    in1 => B(12),
    in2 => B(10),
    s => s,
    z => H(11));
    
mux12 : mux3_1bit port map(
    in0 => B(12),
    in1 => B(13),
    in2 => B(11),
    s => s,
    z => H(12));
    
mux13 : mux3_1bit port map(
    in0 => B(13),
    in1 => B(14),
    in2 => B(12),
    s => s,     
    z => H(13));
    
mux14 : mux3_1bit port map(
        in0 => B(14),
        in1 => B(15),
        in2 => B(13),
        s => s,
        z => H(14));
        
mux15 : mux3_1bit port map(
        in0 => B(15),
        in1 => IR,
        in2 => B(14),
        s => s,
        z => H(15));        
end Behavioral;
