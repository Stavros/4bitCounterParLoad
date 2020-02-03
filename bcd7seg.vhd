-- Engineer:	Stavros Kalapothas
-- Create Date:	30/12/2019
-- Project Name: ask2.3 & ask2.4
-- based on fpga4student.com

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd7seg is
port (
      CLK : in std_logic;
        bcd : in std_logic_vector(3 downto 0);  --BCD input
        leds : out std_logic_vector(6 downto 0)  -- 7 bit decoded output.
    );
end bcd7seg;
--'a' corresponds to MSB of segment7 and g corresponds to LSB of segment7.
architecture Behavioral of bcd7seg is

begin
process (CLK,bcd)
BEGIN
if (CLK'event and CLK='1') then
case bcd is
when "0000"=> leds <="0111111";  -- '0'
when "0001"=> leds <="0000110";  -- '1'
when "0010"=> leds <="1011011";  -- '2'
when "0011"=> leds <="1001111";  -- '3'
when "0100"=> leds <="1100110";  -- '4'
when "0101"=> leds <="1101101";  -- '5'
when "0110"=> leds <="1111101";  -- '6'
when "0111"=> leds <="0000111";  -- '7'
when "1000"=> leds <="1111111";  -- '8'
when "1001"=> leds <="1101111";  -- '9'
 --nothing is displayed when a number more than 9 is given as input.
when others=> leds <="1000000";
end case;
end if;

end process;

end Behavioral;