----------------------------------------------------------------------------------
-- Company: QMUL DSD Group
-- Engineer: Patrick Balcombe 
-- 
-- Create Date:    15:29:28 10/09/2016 
-- Design Name: Two Input Multiplexor
-- Module Name:    TwoInputMultiplexor_VHDL - Behavioral 
-- Project Name: DSD LAB 1
-- Target Devices: 
-- Tool versions: 
-- Description: Single two input multiplexor with two data inputs, one control line and 1 data output.
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

entity TwoInputMultiplexor_VHDL is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           Con : in  STD_LOGIC;
           d : out  STD_LOGIC);
end TwoInputMultiplexor_VHDL;

architecture Behavioral of TwoInputMultiplexor_VHDL is

begin 
	process (a, b, Con)--watch for change in a, b and Con
		begin
		if Con = '0' then --input line a selected
			d <= a after 7 ns;
		else--input line b selected
			d <= b after 7 ns;
		end if;
	end process;	


end Behavioral;

