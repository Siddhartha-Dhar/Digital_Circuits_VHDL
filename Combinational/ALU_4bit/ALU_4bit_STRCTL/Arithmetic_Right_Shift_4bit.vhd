----------------------------------------------------------------------------------
-- University:     University of Calcutta 
-- Engineer:       Siddhartha Dhar
-- 
-- Module Name:    Arithmetic_Left_Shift_4bit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------------------------------------------------Entity Definition
entity Arithmetic_Right_Shift_4bit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end Arithmetic_Right_Shift_4bit;

------------------------------------------------------------------Architecture Definition
architecture ARTH_R_SHFT_DFLOW of Arithmetic_Right_Shift_4bit is
signal f: STD_LOGIC_VECTOR(3 downto 0);
begin
	f(3) <= A(3);
	f(2) <= A(3);
	f(1) <= A(2);
	f(0) <= A(1);
	Y <= f;
end ARTH_R_SHFT_DFLOW;