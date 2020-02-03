----------------------------------------------------------------------------------
-- Company: QMUL DSD Goup 2
-- Engineer: Patrick Balcombe
-- 
-- Create Date:    12:42:54 10/28/2016 
-- Design Name: 	D Flip-Flop
-- Module Name:    dFlipFlop - Behavioral 
-- Project Name: 	Lab3
-- Target Devices: 
-- Tool versions: 
-- Description: A single D flip flop
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

entity dFlipFlop is
    Port ( D : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           preset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           Q_bar : inout  STD_LOGIC);
end dFlipFlop;

architecture Behavioral of dFlipFlop is

begin
	
	process (D, reset, preset, CLK)
	
		begin		
			
			if (reset = '1') then
				Q <= '0';
				Q_bar <= '1';
			else 
				if (preset = '1') then
					Q <= '1';
					Q_bar <= '0';			
				else 
					if (CLK = '1' and CLK'event) then
						Q <= D;
						Q_bar <= not D;	
					end if;
				end if;
			end if;
		
	end process;


end Behavioral;

