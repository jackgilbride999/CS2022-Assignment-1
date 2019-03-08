library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_detector_16bit is
    Port ( G : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC);
end zero_detector_16bit;

architecture Behavioral of zero_detector_16bit is
constant delay: Time := 1 ns;
begin
Z <= '1' after delay when G="00000000000000000"
        else '0' after delay;
end Behavioral;
