----------------------------------------------------------------------------------
-- University:     University of Calcutta 
-- Engineer:       Siddhartha Dhar
-- 
-- Module Name:    Full_Adder - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-------------------------------------------------Entity Definition
entity Full_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Carry : out  STD_LOGIC;
           Sum : out  STD_LOGIC);
end Full_Adder;

-------------------------------------------------Architecture Definition
architecture FULL_ADDER_DFLOW of Full_Adder is
signal t: STD_LOGIC_VECTOR(2 downto 0);
begin
	t(0) <= (A xor B);
	Sum <= (t(0) xor C);
	t(1) <= (t(0) and C);
	t(2) <= (A and B);
	Carry <= (t(1) or t(2));
end FULL_ADDER_DFLOW;