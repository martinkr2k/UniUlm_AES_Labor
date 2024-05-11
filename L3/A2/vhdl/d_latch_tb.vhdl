library ieee;
use ieee.std_logic_1164.all;

entity d_latch_tb is 
end d_latch_tb;


architecture TB of d_latch_tb is 
  signal s_clk, s_d : std_logic;
  signal s_q : std_logic; 

  begin 

    --RSL : entity work.d_latch(STRUCTURAL_NOR) port map (s_clk, s_d, s_q);
    RSL : entity work.d_latch(STRUCTURAL_NAND) port map (s_clk, s_d, s_q);
    
    process 
    begin 

      -- TC 1
      s_clk <= '1';
      s_d <= '1';
      wait for 2 ns;
      assert (s_q = '1') report "TC 1: initial set!";

      
      -- TC 2
      s_clk <= '0';
      s_d <= '0';
      wait for 2 ns;
      assert (s_q = '1') report "TC 2: reset!";

      s_clk <= '1';
      s_d <= '0';
      wait for 2 ns;
      assert (s_q = '0') report "TC 2: reset!";


      -- TC 3
      s_clk <= '0';
      s_d <= '1';
      wait for 2 ns;
      assert (s_q = '0') report "TC 3: set a!";

      s_clk <= '1';
      s_d <= '1';
      wait for 2 ns;
      assert (s_q = '1') report "TC 3: set b!";

      report "end of test";
      wait;

    end process;

end TB;
