library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity reg16 is
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           load : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end reg16;

architecture Behavioral of reg16 is
constant delay: Time := 1 ns;
begin
process(clk)
    begin
    if(rising_edge(clk)) then
        if load='1' then
            Q<=D after delay;
        end if;
     end if;
end process;

end Behavioral;
