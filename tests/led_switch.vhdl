library ieee;
use ieee.std_logic_1164.all;

entity led_switch is 
  port (
    sw : in std_logic_vector(9 downto 0);
    ledr : out std_logic_vector(9 downto 0)
  );
end led_switch;

architecture DATAFLOW of led_switch is 
  begin
    
    ledr(9 downto 5) <= sw(9) & sw(9) & sw(9) & sw(9) & sw(9);
    ledr(4 downto 0) <= sw(8) & sw(8) & sw(8) & sw(8) & sw(8);

end DATAFLOW;
