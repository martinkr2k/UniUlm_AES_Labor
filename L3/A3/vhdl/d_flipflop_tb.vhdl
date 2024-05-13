library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop_tb is
end d_flipflop_tb;


architecture TB of d_flipflop_tb is
  signal sw : std_logic_vector(9 downto 0);
  signal ledr : std_logic_vector(9 downto 0);
  begin 

    DFF : entity work.d_flipflop(DATAFLOW) port map(sw, ledr);
    

    process 
    begin 


      -- TC 1
      sw(1) <= '1';
      sw(0) <= '1';
      wait for 2 ns;
      
      sw(1) <= '0';
      sw(0) <= '1';
      wait for 2 ns;
      assert(ledr(0) = '1') report "TC 1: set 1";
  
      sw(1) <= '0';
      sw(0) <= '0';
      wait for 2 ns;
      assert(ledr(0) = '1') report "TC 1: set 1";
  
  
      -- TC 2
      sw(1) <= '1';
      sw(0) <= '0';
      wait for 2 ns;
      assert(ledr(0) = '1') report "TC 2: set 0";
      
      sw(1) <= '0';
      sw(0) <= '0';
      wait for 2 ns;
      assert(ledr(0) = '0') report "TC 2: set 0";
  
      sw(1) <= '0';
      sw(0) <= '1';
      wait for 2 ns;
      assert(ledr(0) = '0') report "TC 2: set 0";
  
  
      -- TC 3
      sw(1) <= '1';
      sw(0) <= '1';
      wait for 2 ns;
      assert(ledr(0) = '0') report "TC 3: set 1";
     
      sw(1) <= '0';
      sw(0) <= '1';
      wait for 2 ns;
      assert(ledr(0) = '1') report "TC 3: set 1";
  
      sw(1) <= '0';
      sw(0) <= '0';
      wait for 2 ns;
      assert(ledr(0) = '1') report "TC 3: set 1";


    report "end of test!";
    wait;
  
  end process;

end TB;
