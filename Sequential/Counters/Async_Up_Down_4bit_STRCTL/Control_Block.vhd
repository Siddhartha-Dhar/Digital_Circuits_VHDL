----------------------------------------------------------------------------------
-- University:     University of Calcutta
-- Engineer:       Siddhartha Dhar
-- 
-- Module Name:    Control_Block - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-----------------------------------------Entity Definition
entity Control_Block is
    Port ( Control : in  STD_LOGIC;
           Q : in  STD_LOGIC;
           Qb : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end Control_Block;
-----------------------------------------------Architecture Definition
architecture CB_DFLOW of Control_Block is
signal a, b, cinv: STD_LOGIC;
begin
	cinv <= not Control;
	a <= (Q and Control);
	b <= (Qb and cinv);
	Y <= (a or b);
end CB_DFLOW;