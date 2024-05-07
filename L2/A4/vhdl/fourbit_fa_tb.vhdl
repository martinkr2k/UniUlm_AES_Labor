library ieee;
use ieee.std_logic_1164.all;

entity fourbit_fa_tb is 
end fourbit_fa_tb;


architecture TB of fourbit_fa_tb is 
  signal s_a, s_b, s_sum : std_logic_vector(3 downto 0);
  signal s_cin, s_cout : std_logic;
  begin
    
    FOURBIT_FA : entity work.fourbit_fa(DATAFLOW) port map(s_a, s_b, s_cin, s_sum, s_cout);
    
    process
    begin
      
      s_a <= "0000";
      s_b <= "0000";
      s_cin <= '0';
      wait for 5 ns;
      assert (s_sum = "0000") report "TC 1: error sum!";
      assert (s_cout = '0') report "TC 1: error carry!";

      s_a <= "0001";
      s_b <= "0001";
      s_cin <= '0';
      wait for 5 ns;
      assert (s_sum = "0010") report "TC 2: error sum!";
      assert (s_cout = '0') report "TC 2: error carry!";
 
      s_a <= "1111";
      s_b <= "0001";
      s_cin <= '0';
      wait for 5 ns;
      assert (s_sum = "0000") report "TC 3: error sum!";
      assert (s_cout = '1') report "TC 3: error carry!";

      report "end of test!";
      wait;
    end process;
end TB;
