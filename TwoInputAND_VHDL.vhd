----------------------------------------------------------------------------------
-- Company: QMUL DSD Group
-- Engineer: Patrick Balcombe 
-- 
-- Create Date:    15:24:38 10/09/2016 
-- Design Name:    Two Input AND gate
-- Module Name:    TwoInputAND_VHDL - Behavioral 
-- Project Name: DSD LAB 1
-- Target Devices: 
-- Tool versions: 
-- Description: Single Two Input AND gate.
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

entity TwoInputAND_VHDL is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end TwoInputAND_VHDL;

architecture Behavioral of TwoInputAND_VHDL is

begin
	c <= a and b after 7ns;

end Behavioral;

