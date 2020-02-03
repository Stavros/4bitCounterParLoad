-- Engineer:	Stavros Kalapothas
-- Create Date:	4/1/2020
-- Project Name: ask2 
-- based on: https://github.com/pjbal

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbitReg is
	generic(n : positive := 4);
    Port ( CLK : in  STD_LOGIC;
           D_inputs : in  STD_LOGIC_vector (n-1 downto 0);
           reset : in  STD_LOGIC;
           preset : in  STD_LOGIC;
           Q_outputs : inout  STD_LOGIC_vector (n-1 downto 0);
           Q_bar_outputs : inout  STD_LOGIC_vector (n-1 downto 0));
end nbitReg;

architecture Behavioral of nbitReg is

component dFlipFlop is
    Port ( D : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           preset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           Q_bar : inout  STD_LOGIC);
end component;

begin

	init: for i in n-1 downto 0 generate--loop through all n d flip lops to add
		dIinit: dFLipFlop port map (D_inputs(i), reset, preset, CLK, Q_outputs(i), Q_bar_outputs(i));--define connections of d flip flop within the device
		
	end generate;

	


end Behavioral;

