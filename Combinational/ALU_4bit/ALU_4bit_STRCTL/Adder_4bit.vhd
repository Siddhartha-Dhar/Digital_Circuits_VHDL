----------------------------------------------------------------------------------
-- University:     University of Calcutta 
-- Engineer:       Siddhartha Dhar
-- 
-- Module Name:    Adder_4bit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-------------------------------------------Entity Definition
entity Adder_4bit is
    Port ( Cin : in STD_LOGIC;
			  A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0));
end Adder_4bit;

-------------------------------------------Architecture Definition
architecture ADDR_STRCTL of Adder_4bit is
component Full_Adder
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Carry : out  STD_LOGIC;
           Sum : out  STD_LOGIC);
end component;
signal Ctmp : STD_LOGIC_VECTOR(2 downto 0);
begin
	T0: Full_Adder port map(A=>A(0), B=>B(0), C=>Cin, Carry=>Ctmp(0), Sum=>Sum(0)); ------ Full Adder for LSb
	T1: Full_Adder port map(A=>A(1), B=>B(1), C=>Ctmp(0), Carry=>Ctmp(1), Sum=>Sum(1)); -- Full Adder for 2nd higher order bit
	T2: Full_Adder port map(A=>A(2), B=>B(2), C=>Ctmp(1), Carry=>Ctmp(2), Sum=>Sum(2)); -- Full Adder for 3rd higher order bit
	T3: Full_Adder port map(A=>A(3), B=>B(3), C=>Ctmp(2), Carry=>Cout, Sum=>Sum(3)); ------ Full Adder for MSb
end ADDR_STRCTL;