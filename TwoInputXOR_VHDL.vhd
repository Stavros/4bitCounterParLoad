----------------------------------------------------------------------------------
-- Company: QMUL DSD Group
-- Engineer: Patrick Balcombe 
-- 
-- Create Date:    15:26:00 10/09/2016 
-- Design Name:    Two Input XOR gate
-- Module Name:    TwoInputXOR_VHDL - Behavioral 
-- Project Name: DSD LAB 1
-- Target Devices: 
-- Tool versions: 
-- Description: Single Two Input XOR gate.
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

entity TwoInputXOR_VHDL is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end TwoInputXOR_VHDL;

architecture Behavioral of TwoInputXOR_VHDL is

begin
process(a,b)--watch for change in a and b
	begin
	--define output relationship with inputs a and b
	c <= (a or b) and ( not(a and b)) after 7ns;
end process;

end Behavioral;

