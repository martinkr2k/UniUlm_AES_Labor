library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;

entity led_switch_tb is
end led_switch_tb;

architecture BEHAVIOR of led_switch_tb is 
  signal sw, ledr : std_logic_vector(9 downto 0);
  begin 
    
    LS_DATAFLOW : entity work.led_switch(DATAFLOW) port map(sw, ledr);
  
    process begin
      
      -- tc1: 8 = '0' / 9 = '0'
      sw(8) <= '0';
      sw(9) <= '0';
      wait for 2 ns;
      assert (ledr(9) = '0') report "tc1: error";
      assert (ledr(8) = '0') report "tc1: error";
      assert (ledr(7) = '0') report "tc1: error";
      assert (ledr(6) = '0') report "tc1: error";
      assert (ledr(5) = '0') report "tc1: error";
      assert (ledr(4) = '0') report "tc1: error";
      assert (ledr(3) = '0') report "tc1: error";
      assert (ledr(2) = '0') report "tc1: error";
      assert (ledr(1) = '0') report "tc1: error";
      assert (ledr(0) = '0') report "tc1: error";


      -- tc2: 8 = '0' / 9 = '1'
      sw(8) <= '0';
      sw(9) <= '1';
      wait for 2 ns;
      assert (ledr(9) = '1') report "tc2: error";
      assert (ledr(8) = '1') report "tc2: error";
      assert (ledr(7) = '1') report "tc2: error";
      assert (ledr(6) = '1') report "tc2: error";
      assert (ledr(5) = '1') report "tc2: error";
      assert (ledr(4) = '0') report "tc2: error";
      assert (ledr(3) = '0') report "tc2: error";
      assert (ledr(2) = '0') report "tc2: error";
      assert (ledr(1) = '0') report "tc2: error";
      assert (ledr(0) = '0') report "tc2: error";


      -- tc3: 8 = '1' / 9 = '0'
      sw(8) <= '1';
      sw(9) <= '0';
      wait for 2 ns;
      assert (ledr(9) = '0') report "tc3: error";
      assert (ledr(8) = '0') report "tc3: error";
      assert (ledr(7) = '0') report "tc3: error";
      assert (ledr(6) = '0') report "tc3: error";
      assert (ledr(5) = '0') report "tc3: error";
      assert (ledr(4) = '1') report "tc3: error";
      assert (ledr(3) = '1') report "tc3: error";
      assert (ledr(2) = '1') report "tc3: error";
      assert (ledr(1) = '1') report "tc3: error";
      assert (ledr(0) = '1') report "tc3: error";


      -- tc4: 8 = '1' / 9 = '1'
      sw(8) <= '1';
      sw(9) <= '1';
      wait for 2 ns;
      assert (ledr(9) = '1') report "tc4: error";
      assert (ledr(8) = '1') report "tc4: error";
      assert (ledr(7) = '1') report "tc4: error";
      assert (ledr(6) = '1') report "tc4: error";
      assert (ledr(5) = '1') report "tc4: error";
      assert (ledr(4) = '1') report "tc4: error";
      assert (ledr(3) = '1') report "tc4: error";
      assert (ledr(2) = '1') report "tc4: error";
      assert (ledr(1) = '1') report "tc4: error";
      assert (ledr(0) = '1') report "tc4: error";

      report "end of test";
      wait;
    end process;

end BEHAVIOR;


