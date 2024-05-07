LIBRARY ieee;
USE ieee . std_logic_1164 . all;

Entity led_switch IS
PORT (
	sw : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	ledr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
);
END led_switch;

ARCHITECTURE behavior OF led_switch IS
BEGIN
	ledr <= sw;
END behavior;