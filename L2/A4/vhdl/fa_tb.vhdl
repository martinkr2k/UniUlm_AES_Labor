library ieee;
use ieee.std_logic_1164.all;

entity fa_tb is 
end fa_tb;


architecture TB of fa_tb is 
  signal s_a, s_b, s_c, s_sum, s_cout : std_logic := '0';
  begin 
    
    FA : entity work.fa(DATAFLOW) port map(s_a, s_b, s_c, s_sum, s_cout);

    process
    begin 

      -- TC 1: a=0, b=0, c=0
      s_a <= '0';
      s_b <= '0';
      s_c <= '0';
      wait for 2 ns;
      assert (s_sum = '0') report "TC1: error sum!";
      assert (s_cout = '0') report "TC1: error carry!";

      -- TC 2: a=1, b=0, c=0
      s_a <= '1';
      s_b <= '0';
      s_c <= '0';
      wait for 2 ns;
      assert (s_sum = '1') report "TC2: error sum!";
      assert (s_cout = '0') report "TC2: error carry!";

      -- TC 3: a=0, b=1, c=0
      s_a <= '0';
      s_b <= '1';
      s_c <= '0';
      wait for 2 ns;
      assert (s_sum = '1') report "TC3: error sum!";
      assert (s_cout = '0') report "TC3: error carry!";

      -- TC 4: a=0, b=0, c=1
      s_a <= '0';
      s_b <= '0';
      s_c <= '1';
      wait for 2 ns;
      assert (s_sum = '1') report "TC4: error sum!";
      assert (s_cout = '0') report "TC4: error carry!";

      -- TC 5: a=1, b=1, c=0
      s_a <= '1';
      s_b <= '1';
      s_c <= '0';
      wait for 2 ns;
      assert (s_sum = '0') report "TC5: error sum!";
      assert (s_cout = '1') report "TC5: error carry!";

      -- TC 6: a=1, b=0, c=1
      s_a <= '1';
      s_b <= '0';
      s_c <= '1';
      wait for 2 ns;
      assert (s_sum = '0') report "TC6: error sum!";
      assert (s_cout = '1') report "TC6: error carry!";

      -- TC 7: a=1, b=0, c=1
      s_a <= '0';
      s_b <= '1';
      s_c <= '1';
      wait for 2 ns;
      assert (s_sum = '0') report "TC7: error sum!";
      assert (s_cout = '1') report "TC7: error carry!";
      
      -- TC 8: a=1, b=1, c=1
      s_a <= '1';
      s_b <= '1';
      s_c <= '1';
      wait for 2 ns;
      assert (s_sum = '1') report "TC8: error sum!";
      assert (s_cout = '1') report "TC8: error carry!";


      report "end of test!";
      wait;
    end process;

end TB;
