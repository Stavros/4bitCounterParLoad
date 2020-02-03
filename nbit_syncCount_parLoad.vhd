-- Engineer:	Stavros Kalapothas
-- Create Date:	4/1/2020
-- Project Name: ask2 
-- based on: https://github.com/pjbal

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbitCounter_ParLoad is
	Generic (n : positive := 4);
	Port ( D_inputs : in  STD_LOGIC_VECTOR (n-1 downto 0);
           load : in  STD_LOGIC;
           count_enable : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q_outputs : inout  STD_LOGIC_VECTOR (n-1 downto 0);
	   ripple_carry_out : out std_logic;
	   leds : out std_logic_vector (6 downto 0)
	); -- 7 bit decoded output
end nbitCounter_ParLoad;

architecture Behavioral of nbitCounter_ParLoad is
	
component nbit_incrementor
	generic ( n : positive := 4);
   Port ( InA : in  STD_LOGIC_VECTOR (n-1 downto 0);
           C_in : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (n-1 downto 0);
           C_out : out  STD_LOGIC);
end component;
	
component nbitReg is
	 generic(n : positive := 4);
    Port ( 
           D_inputs : in  STD_LOGIC_vector (n-1 downto 0);
			  CLK : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           preset : in  STD_LOGIC;
           Q_outputs : inout  STD_LOGIC_vector (n-1 downto 0);
           Q_bar_outputs : inout  STD_LOGIC_vector (n-1 downto 0));
end component;
	
component nbitTwoInputMux_VHDL is 
	generic (n: positive := 4);
    Port ( InA : in  STD_LOGIC_VECTOR (n-1 downto 0);
           InB : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Control : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

-- BCD7SEG component
component bcd7seg is
port (
      CLK : in std_logic;
        bcd : in std_logic_vector(3 downto 0);  --BCD input
        leds : out std_logic_vector(6 downto 0)  -- 7 bit decoded output.
    );
end component;

component clock_div is
port (
   clk_in: in std_logic; -- clock input on FPGA
   clk_out: out std_logic -- clock output 
  );
end component;

--SIGNALS

signal clk1s: std_logic;
signal inctomux : std_logic_vector (4-1 downto 0);
signal muxtoreg: std_logic_vector (4-1 downto 0);
--signal Q_outputs: STD_LOGIC_VECTOR (4-1 downto 0);
--signal leds: std_logic_vector (6 downto 0);
begin

div: clock_div port map (CLK, clk1s);
inc: nbit_incrementor generic map (n) port map (Q_outputs, count_enable, inctomux);
mux: nbitTwoInputMux_VHDL generic map (n) port map (inctomux, D_inputs, load, muxtoreg ); 
reg: nbitReg generic map (n) port map (muxtoreg, clk1s, reset, '0', Q_outputs); 
seg: bcd7seg port map (clk1s, Q_outputs, leds);

end Behavioral;
