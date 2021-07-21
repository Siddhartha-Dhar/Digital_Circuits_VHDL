----------------------------------------------------------------------------------
-- University:     University of Calcutta 
-- Engineer:       Siddhartha Dhar
-- 
-- Module Name:    BUS_MUX_4X1 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-------------------------------------------------------Entity Definition
entity BUS_MUX_4X1 is
    Port ( I0 : in  STD_LOGIC_VECTOR (3 downto 0);  -- First Input 4bit Bus
           I1 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Second Input 4bit Bus
           I2 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Third Input 4bit Bus
           I3 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Fourth Input 4bit Bus
           S : in  STD_LOGIC_VECTOR(1 downto 0);   -- Select Lines
           Y : out  STD_LOGIC_VECTOR (3 downto 0)); -- Output 4bit Bus
end BUS_MUX_4X1;

--------------------------------------------------------Architecture Definition
architecture Behavioral of BUS_MUX_4X1 is
begin

process(S, I0, I1, I2, I3)
begin
		if(S="00")then
			Y <= I0;
		elsif(S="01")then
			Y <= I1;
		elsif(S="10")then
			Y <= I2;
		else
			Y <= I3;
		end if;
end process;

end Behavioral;