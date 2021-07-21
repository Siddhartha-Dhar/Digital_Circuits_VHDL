----------------------------------------------------------------------------------
-- University:     University of Calcutta 
-- Engineer:       Siddhartha Dhar
-- 
-- Module Name:    Logical_Left_Shift_4bit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------Entity Definition
entity Logical_Left_Shift_4bit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end Logical_Left_Shift_4bit;
----------------------------------------------------------Architecture Defintion
architecture LLS_4_DFLOW of Logical_Left_Shift_4bit is
Signal f: STD_LOGIC_VECTOR(3 downto 0);
begin
	f(0)<='0'; -- O inserted from left
	f(1)<=A(0);
	f(2)<=A(1);
	f(3)<=A(2);
	Y <= f;
end LLS_4_DFLOW;