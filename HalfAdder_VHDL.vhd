----------------------------------------------------------------------------------
-- Company: QMUL DSD Group
-- Engineer: Patrick Balcombe 
-- 
-- Create Date:    15:27:46 10/09/2016 
-- Design Name: Half Adder
-- Module Name:    HalfAdder_VHDL - Behavioral 
-- Project Name: DSD LAB 1
-- Target Devices: 
-- Tool versions: 
-- Description: Single Half Adder.
--
-- Dependencies: 
					
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HalfAdder_VHDL is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end HalfAdder_VHDL;

architecture Behavioral of HalfAdder_VHDL is
	--define component input and outputs for a two input XOR gate
	component TwoInputXOR_VHDL
		port( a : in STD_LOGIC;
				b : in STD_LOGIC;
				c : out STD_LOGIC);
	end component;
	--define component input and outputs for a two input and gate
	component TwoInputAND_VHDL
		port( a : in STD_LOGIC;
				b : in STD_LOGIC;
				c : out STD_LOGIC);
		end component;
		
	
	
begin
	--define Sum input-output relationship
	sumIO: TwoInputXOR_VHDL port map (a, b, s);
	--define carry input-output relationship
	CoutIO: TwoInputAND_VHDL port map (a, b, Cout);
	
end Behavioral;

