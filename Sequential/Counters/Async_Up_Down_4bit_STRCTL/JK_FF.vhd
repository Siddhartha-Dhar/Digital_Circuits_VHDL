----------------------------------------------------------------------------------
-- University:     University of Calcutta 
-- Engineer:       Siddhartha Dhar
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-----------------------------------Entity Definition
entity JK_FF is
    Port ( CLOCK : in STD_LOGIC;
			  J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           SET : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           Q : out  STD_LOGIC := '0';
           Qb : out  STD_LOGIC := '1');
end JK_FF;
---------------------------------------Architecture Definition
architecture JK_FF_ARCH of JK_FF is
begin
p1: process(CLOCK, SET, CLR)
variable tmp: STD_LOGIC := '0';
begin
	if(SET='1')then
		tmp := '1';
		Q <= '1';
		Qb <= '0';
	elsif(CLR='1')then
		tmp := '0';
		Q <= '0';
		Qb <= '1';
	elsif(rising_edge(CLOCK))then --If Clock's Poisitive Edge Trigerred
		if(J='0' and K='0')then    -- No Change
			tmp := tmp;
		elsif(J='1' and K='1')then -- Toogle
			tmp := not tmp;
		elsif(J='0' and K='1')then -- Reset
			tmp := '0';
		else                       -- Set
			tmp := '1';
		end if;
	end if;
	Q <= tmp;
	Qb <= not tmp;
end process p1;
end JK_FF_ARCH;