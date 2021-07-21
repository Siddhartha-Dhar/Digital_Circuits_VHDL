----------------------------------------------------------------------------------
-- University:     University of Calcutta 
-- Engineer:       Siddhartha Dhar
-- 
-- Module Name:    Logic_Unit_02 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-----------------------------------------------Entity Definition
entity Logic_Unit_02 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR(1 downto 0);   -- Select Lines
           Y : out  STD_LOGIC_VECTOR (3 downto 0)); -- Output 4bit Bus
end Logic_Unit_02;

-----------------------------------------------Architecture Definition
architecture LU_02_STRCTL of Logic_Unit_02 is
-----------------------------------------------BUS Multiplexer 4bit width
component BUS_MUX_4X1
    Port ( I0 : in  STD_LOGIC_VECTOR (3 downto 0);  -- First Input 4bit Bus
           I1 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Second Input 4bit Bus
           I2 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Third Input 4bit Bus
           I3 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Fourth Input 4bit Bus
           S : in  STD_LOGIC_VECTOR(1 downto 0);   -- Select Lines
           Y : out  STD_LOGIC_VECTOR (3 downto 0)); -- Output 4bit Bus
end component;
-----------------------------------------------Logical Left Shift 4bit
component Logical_Left_Shift_4bit
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
-----------------------------------------------Logical Right Shift 4bit
component Logical_Right_Shift_4bit
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
-----------------------------------------------Arithmetic RIght Shift
component Arithmetic_Right_Shift_4bit
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
Signal F0, F1, F2, F3: STD_LOGIC_VECTOR(3 downto 0);
begin

	T0: Logical_Left_Shift_4bit port map(A=>A, Y=>F0); -- Logical Left Shift Component
	T1: Logical_Right_Shift_4bit port map(A=>A, Y=>F1);-- Logical Right Shift Component
	T2: Logical_Left_Shift_4bit port map(A=>A, Y=>F2);
	T3: Arithmetic_Right_Shift_4bit port map(A=>A, Y=>F3); -- Arithmetic Right Shift Component
	T4: BUS_MUX_4X1 port map(I0=>F0, I1=>F1, I2=>F2, I3=>F3, S=>S, Y=>Y);
	
end LU_02_STRCTL;