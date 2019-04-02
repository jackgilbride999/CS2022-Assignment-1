library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register_16bits is
    Port ( instruction_in : in STD_LOGIC_VECTOR (15 downto 0);
           IL : in STD_LOGIC;
           clk : in STD_LOGIC;
           opcode : out STD_LOGIC_VECTOR (6 downto 0);
           DR : out STD_LOGIC_VECTOR (2 downto 0);
           SA : out STD_LOGIC_VECTOR (2 downto 0);
           SB : out STD_LOGIC_VECTOR (2 downto 0));
end instruction_register_16bits;

architecture Behavioral of instruction_register_16bits is
signal output : STD_LOGIC_VECTOR(15 downto 0);
constant delay: Time := 1 ns;

begin

process(clk)
    begin
    if(rising_edge(clk)) then
        if IL='1' then
            output<=instruction_in after delay;
        end if;
     end if;
end process;

opcode <= output(15 downto 9);
DR <= output(8 downto 6);
SA <= output(5 downto 3);
SB <= output(2 downto 0);

end Behavioral;
