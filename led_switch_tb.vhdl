library ieee;
use ieee.std_logic_1164.all;

entity led_switch_tb is 
end led_switch_tb;

architecture tb of led_switch_tb is 
	signal sw, ledr : std_logic_vector(9 downto 0) := (others => '0');
	begin 
		LS : entity work.led_switch(behavior) port map(sw, ledr);
		process begin 
			
			-- 0 / 0
			wait for 2 ns;
			assert(ledr(9) = '0') report "error";
			assert(ledr(8) = '0') report "error";
			assert(ledr(7) = '0') report "error";
			assert(ledr(6) = '0') report "error";
			assert(ledr(5) = '0') report "error";
			assert(ledr(4) = '0') report "error";
			assert(ledr(3) = '0') report "error";
			assert(ledr(2) = '0') report "error";
			assert(ledr(1) = '0') report "error";
			assert(ledr(0) = '0') report "error";

			-- 0 / 1
			sw(9) <= '1';
			wait for 2 ns;
			assert(ledr(9) = '1') report "error";
			assert(ledr(8) = '1') report "error";
			assert(ledr(7) = '1') report "error";
			assert(ledr(6) = '1') report "error";
			assert(ledr(5) = '1') report "error";
			assert(ledr(4) = '0') report "error";
			assert(ledr(3) = '0') report "error";
			assert(ledr(2) = '0') report "error";
			assert(ledr(1) = '0') report "error";
			assert(ledr(0) = '0') report "error";
			
			-- 1 / 0
			sw(8) <= '1';
			sw(9) <= '0';
			wait for 2 ns;
			assert(ledr(9) = '0') report "error";
			assert(ledr(8) = '0') report "error";
			assert(ledr(7) = '0') report "error";
			assert(ledr(6) = '0') report "error";
			assert(ledr(5) = '0') report "error";
			assert(ledr(4) = '1') report "error";
			assert(ledr(3) = '1') report "error";
			assert(ledr(2) = '1') report "error";
			assert(ledr(1) = '1') report "error";
			assert(ledr(0) = '1') report "error";


			-- 1 / 1
			sw(8) <= '1';
			sw(9) <= '1';
			wait for 2 ns;
			assert(ledr(9) = '1') report "error";
			assert(ledr(8) = '1') report "error";
			assert(ledr(7) = '1') report "error";
			assert(ledr(6) = '1') report "error";
			assert(ledr(5) = '1') report "error";
			assert(ledr(4) = '1') report "error";
			assert(ledr(3) = '1') report "error";
			assert(ledr(2) = '1') report "error";
			assert(ledr(1) = '1') report "error";
			assert(ledr(0) = '1') report "error";




			report "end of test!";
			wait;
		end process;
end tb;
