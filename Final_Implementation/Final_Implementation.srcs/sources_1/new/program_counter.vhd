library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter is
    Port ( address : in STD_LOGIC_VECTOR (15 downto 0);
           PL : in STD_LOGIC;
           PI : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (15 downto 0));
end program_counter;

architecture Behavioral of program_counter is

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

   
register_in <= "0000000000000000" after delay when reset = '1'
else adder_out after delay when PI='1'
else address after delay when PL ='1';

PC_out <= register_out;
end Behavioral;
