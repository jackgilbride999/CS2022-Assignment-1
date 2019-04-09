----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2019 05:36:20 PM
-- Design Name: 
-- Module Name: microprocessor_8reg_16bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity microprocessor_8reg_16bit is
    Port ( reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           MW : out STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           address_out : out STD_LOGIC_VECTOR (15 downto 0));
end microprocessor_8reg_16bit;

architecture Behavioral of microprocessor_8reg_16bit is

begin


end Behavioral;
