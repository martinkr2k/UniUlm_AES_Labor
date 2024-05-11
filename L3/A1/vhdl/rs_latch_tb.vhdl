library ieee;
use ieee.std_logic_1164.all;

entity rs_latch_tb is 
end rs_latch_tb;


architecture TB of rs_latch_tb is 
  signal s_clk, s_r, s_s : std_logic;
  signal s_q : std_logic; 

  begin 

    RSL : entity work.rs_latch(STRUCTURAL_NAND) port map (s_clk, s_r, s_s, s_q);
    
    process 
    begin 

      -- TC 1
      s_clk <= '1';
      s_r <= '0';
      s_s <= '1';
      wait for 2 ns;
      assert (s_q = '1') report "TC 1: initial set!";
      

      -- TC 2
      s_clk <= '0';
      s_r <= '0';
      s_s <= '0';
      wait for 2 ns;
      assert (s_q = '1') report "TC 2: wait!";
      
      s_clk <= '1';
      s_r <= '0';
      s_s <= '0';
      wait for 2 ns;
      assert (s_q = '1') report "TC 2: wait!";


      -- TC 3
      s_clk <= '0';
      s_r <= '1';
      s_s <= '0';
      wait for 2 ns;
      assert (s_q = '1') report "TC 3: reset!";

      s_clk <= '1';
      s_r <= '1';
      s_s <= '0';
      wait for 2 ns;
      assert (s_q = '0') report "TC 3: reset!";


      -- TC 4
      s_clk <= '0';
      s_r <= '0';
      s_s <= '0';
      wait for 2 ns;
      assert (s_q = '0') report "TC 4: wait!";

      s_clk <= '1';
      s_r <= '0';
      s_s <= '0';
      wait for 2 ns;
      assert (s_q = '0') report "TC 4: wait!";


      -- TC 5
      s_clk <= '0';
      s_r <= '0';
      s_s <= '1';
      wait for 2 ns;
      assert (s_q = '0') report "TC 5: set!";

      s_clk <= '1';
      s_r <= '0';
      s_s <= '1';
      wait for 2 ns;
      assert (s_q = '1') report "TC 5: set!";


      -- TC 6
      s_clk <= '0';
      s_r <= '0';
      s_s <= '0';
      wait for 2 ns;
      assert (s_q = '1') report "TC 6: wait!";
      
      s_clk <= '1';
      s_r <= '0';
      s_s <= '0';
      wait for 2 ns;
      assert (s_q = '1') report "TC 6: wait!";
      
      report "end of test";
      wait;

    end process;

end TB;
