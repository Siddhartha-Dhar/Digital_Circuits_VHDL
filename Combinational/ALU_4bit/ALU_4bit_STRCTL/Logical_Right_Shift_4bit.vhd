----------------------------------------------------------------------------------
-- University:     University of Calcutta 
-- Engineer:       Siddhartha Dhar
-- 
-- Module Name:    Logical_Left_Shift_4bit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------------------Entity Definition
entity Logical_Right_Shift_4bit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end Logical_Right_Shift_4bit;

---------------------------------------------------------Architecture Defintion
architecture LRS_4_DFLOW of Logical_Right_Shift_4bit is
Signal f: STD_LOGIC_VECTOR(3 downto 0);
begin
	f(0)<=A(1);
	f(1)<=A(2);
	f(2)<=A(3);
	f(3)<='0'; -- 0 inserted from the Right side
	Y <= f;
end LRS_4_DFLOW;