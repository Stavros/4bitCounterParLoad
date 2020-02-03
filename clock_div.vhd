---- Engineer:	Stavros Kalapothas
---- Create Date:	30/12/2019
---- Project Name: ask2.1
---- based on fpga4student.com

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity clock_div is
--port (
--   clk_in: in std_logic; -- clock input on FPGA
--   clk_out: out std_logic -- clock output 
--  );
--end clock_div;
--
--architecture Behavioral of clock_div is
--
--signal divisor: std_logic_vector(27 downto 0):=(others =>'0');
--
--begin
-- process(clk_in)
-- begin
-- if(clk_in'event and clk_in='1') then
-- divisor <= divisor + x"0000001";
--
-- -- If(divisor>=x"2FAF07F") then -- for running on FPGA -- comment when running simulation
-- -- Modify the divisor (x"2FAF07F"=49999999) below to get the clock frequency you want: 
-- -- Frequency of clk_out = Frequency of (clk_in) divided by (divisor + 1)
-- -- If the frequency of clk_in is 50MHz and the divisor is 49999999=x"2FAF07F", 
-- -- the frequency of clk_out is 1Hz
--
-- if(divisor>=x"2FAF07F") then
-- divisor <= x"0000000";
-- end if;
-- end if;
-- end process;
-- clk_out <= '0' when divisor < x"17D7840" else '1';-- divide clock by half 
--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity clock_div is
port ( clk_in,reset: in std_logic;
clk_out: out std_logic);
end clock_div;
  
architecture bhv of clock_div is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk_in,reset)
begin
if(reset='1') then
count<=1;
tmp<='0';
elsif(clk_in'event and clk_in='1') then
count <=count+1;
if (count = 25000000) then
tmp <= NOT tmp;
count <= 1;
end if;
end if;
clk_out <= tmp;
end process;
  
end bhv;