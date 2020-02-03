-- Engineer:	Stavros Kalapothas
-- Create Date:	4/1/2020
-- Project Name: ask2 
-- based on: https://github.com/pjbal

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--define ports
entity nbitTwoInputMux_VHDL is
	generic (n: positive := 4);
    Port ( InA : in  STD_LOGIC_VECTOR (n-1 downto 0);
           InB : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Control : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (n-1 downto 0));
end nbitTwoInputMux_VHDL;

architecture Behavioral of nbitTwoInputMux_VHDL is

	--define two input muliplexors I/O ports
	component TwoInputMultiplexor_VHDL is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           Con : in  STD_LOGIC;
           d : out  STD_LOGIC);
	end component;
	
begin

	--loop through all n muliplexors
	init: for i in (n-1) downto 0 generate
		initTwoInMux: TwoInputMultiplexor_VHDL port map (InA(i), InB(i), Control, Output(i));--add port relationship of two input mux
	end generate;

end Behavioral;

