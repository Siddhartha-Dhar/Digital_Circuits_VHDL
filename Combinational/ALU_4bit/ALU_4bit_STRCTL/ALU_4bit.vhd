----------------------------------------------------------------------------------
-- University:     University of Calcutta 
-- Engineer:       Siddhartha Dhar
--  
-- Module Name:    ALU_4bit - Behavioral 

-- +---------------------------------------------------+
-- | S3  S2  S1  S0  Cin |         Operation           |
-- +---------------------------------------------------+
-- |  0   0   0   0   0  |      (A+B) Addition         |
-- +---------------------------------------------------+
-- |  0   0   0   0   1  | (A+B+1) Addition with Carry |
-- +---------------------------------------------------+
-- |  0   0   0   1   0  | (A+B') Subtract with Borrow |
-- +---------------------------------------------------+
-- |  0   0   0   1   1  |    (A+B'+1) Subtraction     |
-- +---------------------------------------------------+
-- |  0   0   1   0   0  |       (A-1) Decrement       |
-- +---------------------------------------------------+
-- |  0   0   1   0   1  |         (A) Transfer        |
-- +---------------------------------------------------+
-- |  0   0   1   1   0  |         (A) Transfer        |
-- +---------------------------------------------------+
-- |  0   0   1   1   1  |       (A+1) Increment       |
-- +---------------------------------------------------+
-- |  0   1   0   0   -  |       A and B (bitwise)     |
-- +---------------------------------------------------+
-- |  0   1   0   1   -  |        A or B (bitwise)     |
-- +---------------------------------------------------+
-- |  0   1   1   0   -  |       A xor B (bitwise)     |
-- +---------------------------------------------------+
-- |  0   1   1   1   -  |    A' (Complement Bitwise)  |
-- +---------------------------------------------------+
-- |  1   0   0   0   -  |    Logical Left Shift A     |
-- +---------------------------------------------------+
-- |  1   0   0   1   -  |   Logical Right Shift A     |
-- +---------------------------------------------------+
-- |  1   0   1   0   -  |   Arithmetic Left Shift A   |
-- +---------------------------------------------------+
-- |  1   0   1   1   -  |   Arithmetic Right Shift A  |
-- +---------------------------------------------------+

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-------------------------------------------------------------Entity Definition
entity ALU_4bit is
    Port ( Cin : in STD_LOGIC;
			  A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  S : in  STD_LOGIC_VECTOR(3 downto 0);
           Cout : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_4bit;

--------------------------------------------------------------Architecture Definition
architecture ALU_STRCTL of ALU_4bit is
--------------------------------------------------------------Arithmetic Unit
component Arithmetic_Unit
    Port ( Cin : in STD_LOGIC;
			  A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  S : in  STD_LOGIC_VECTOR(1 downto 0);
           Cout : out  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
--------------------------------------------------------------Logic_Unit_01
component Logic_Unit_01
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR(1 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
--------------------------------------------------------------Logic_Unit_02
component Logic_Unit_02
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR(1 downto 0);   -- Select Lines
           Y : out  STD_LOGIC_VECTOR (3 downto 0)); -- Output 4bit Bus
end component;
--------------------------------------------------------------Bus_MUX_4X1
component BUS_MUX_4X1
    Port ( I0 : in  STD_LOGIC_VECTOR (3 downto 0);  -- First Input 4bit Bus
           I1 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Second Input 4bit Bus
           I2 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Third Input 4bit Bus
           I3 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Fourth Input 4bit Bus
           S : in  STD_LOGIC_VECTOR(1 downto 0);   -- Select Lines
           Y : out  STD_LOGIC_VECTOR (3 downto 0)); -- Output 4bit Bus
end component;
Signal F0, F1, F2: STD_LOGIC_VECTOR(3 downto 0);
begin
		
	T0: Arithmetic_Unit port map(Cin=>Cin, A=>A, B=>B, S(1)=>S(1), S(0)=>S(0), Cout=>Cout, Sum=>F0); -- Arithmetic Unit Component
	T1: Logic_Unit_01 port map(A=>A, B=>B, S(1)=>S(1), S(0)=>S(0), Y=>F1); ---------------------------- Logical Unit 01
	T2: Logic_Unit_02 port map(A=>A, S(1)=>S(1), S(0)=>S(0), Y=>F2); ---------------------------------- Logical Unit 02
	T3: BUS_MUX_4X1 port map(I0=>F0, I1=>F1, I2=>F2, I3=>"0000", S(1)=>S(3), S(0)=>S(2), Y=>Z); ------- Combining the three Units using to an Multiplexer

end ALU_STRCTL;