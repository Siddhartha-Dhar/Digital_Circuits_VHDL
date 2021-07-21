--------------------------------------------------------------------------------
-- University:   University of Calcutta 
-- Engineer:     Siddhartha Dhar
--
-- Project Name:  ALU_4bit_STRCTL
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-----------------------------------------Test Bench Entity 
ENTITY ALU_4bit_TB IS
END ALU_4bit_TB;
-----------------------------------------Architecture Definition
ARCHITECTURE behavior OF ALU_4bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_4bit
    PORT(
         Cin : IN  std_logic;
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         S : IN  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic;
         Z : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Cin : std_logic := '0';
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Cout : std_logic;
   signal Z : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_4bit PORT MAP (
          Cin => Cin,
          A => A,
          B => B,
          S => S,
          Cout => Cout,
          Z => Z
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
      -- insert stimulus here 
		Cin<='0';
		A <= "1010";
		B <= "0100";
		S <= "0000"; -- A+B
		wait for 10 ns;
		Cin <= '1';
		S <= "0011"; -- A+1
		wait for 10 ns;
		S <= "0100";
		wait for 10 ns;
		S <= "1000";
		wait for 10 ns;
		S <= "1011";		
		wait for 10 ns; 
   end process;

END;