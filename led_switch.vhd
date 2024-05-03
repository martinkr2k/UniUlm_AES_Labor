library ieee;
use ieee.std_logic_1164.all;

entity led_switch is 
	port (
		sw : in std_logic_vector(9 downto 0);
		ledr : out std_logic_vector(9 downto 0)
	);
end led_switch;

architecture behavior of led_switch is 
	begin 
	
		ledr <= sw;
	
end behavior;