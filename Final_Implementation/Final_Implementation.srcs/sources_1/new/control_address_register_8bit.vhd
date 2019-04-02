library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_address_register_8bit is
    Port ( in_address : in STD_LOGIC_VECTOR (7 downto 0);
           load_address : in STD_LOGIC;
           clk : in STD_LOGIC;
           address_out : out STD_LOGIC_VECTOR (7 downto 0));
end control_address_register_8bit;

architecture Behavioral of control_address_register_8bit is

component reg16 port(
      D : in STD_LOGIC_VECTOR (15 downto 0);
      load : in STD_LOGIC;
      clk : in STD_LOGIC;
      Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component ripple_adder_16bit port( 
       X : in STD_LOGIC_VECTOR (15 downto 0);
       Y : in STD_LOGIC_VECTOR (15 downto 0);
       c_in : in STD_LOGIC;
       G : out STD_LOGIC_VECTOR (15 downto 0);
       c_out : out STD_LOGIC;
       V : out STD_LOGIC);
end component;

signal adder_out : STD_LOGIC_VECTOR(15 downto 0);
signal register_in : STD_LOGIC_VECTOR(15 downto 0);
signal register_out : STD_LOGIC_VECTOR(15 downto 0);

constant delay: Time := 1 ns;

begin

reg : reg16 port map(
    D => register_in,
    load => '1',
    clk => clk,
    Q => register_out);
    
adder : ripple_adder_16bit port map(
    X => register_out,
    Y => X"0001",
    c_in => '0',
    G => adder_out);
    
register_in <= adder_out after delay when load_address = '0'
else "00000000" & in_address after delay when load_address ='1';

address_out <= register_out(7 downto 0);
end Behavioral;
