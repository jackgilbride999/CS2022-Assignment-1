library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_4to16 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC;
           Q8 : out STD_LOGIC;
           Q9 : out STD_LOGIC;
           Q10 : out STD_LOGIC;
           Q11 : out STD_LOGIC;
           Q12 : out STD_LOGIC;
           Q13 : out STD_LOGIC;
           Q14 : out STD_LOGIC;
           Q15 : out STD_LOGIC);
end decoder_4to16;

architecture Behavioral of decoder_4to16 is

begin
Q0<=((not A0) and (not A1) and (not A2) and (not A3));  --0000
Q1<=((not A0) and (not A1) and (not A2) and (A3));      --0001
Q2<=((not A0) and (not A1) and (A2) and (not A3));      --0010
Q3<=((not A0) and (not A1) and (A2) and (A3));          --0011
Q4<=((not A0) and (A1) and (not A2) and (not A3));      --0100
Q5<=((not A0) and (A1) and (not A2) and (A3));          --0101
Q6<=((not A0) and (A1) and (A2) and (not A3));          --0110
Q7<=((not A0) and (A1) and (A2) and (A3));              --0111
Q8<=((A0) and (not A1) and (not A2) and (not A3));  --0000
Q9<=((A0) and (not A1) and (not A2) and (A3));      --0001
Q10<=((A0) and (not A1) and (A2) and (not A3));      --0010
Q11<=((A0) and (not A1) and (A2) and (A3));          --0011
Q12<=((A0) and (A1) and (not A2) and (not A3));      --0100
Q13<=((A0) and (A1) and (not A2) and (A3));          --0101
Q14<=((A0) and (A1) and (A2) and (not A3));          --0110
Q15<=((A0) and (A1) and (A2) and (A3));              --0111
end Behavioral;
