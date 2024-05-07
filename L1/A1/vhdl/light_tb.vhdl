library ieee;
use ieee.std_logic_1164.all;

entity light_tb is 
end light_tb;

architecture TB of light_tb is
  signal x1, x2 : std_logic := '0';
  signal f : std_logic := '0';
  begin 
    
    LIGHT : entity work.light(DATAFLOW) port map(x1, x2, f);
    process 
    begin 

      -- x1 = '0' / x2 = '0'
      x1 <= '0';
      x2 <= '0';
      wait for 2 ns;
      assert (f = '0') report "tc1 error!";

      -- x1 = '1' / x2 = '0'
      x1 <= '1';
      x2 <= '0';
      wait for 2 ns;
      assert (f = '1') report "tc2 error!";
      
      -- x1 = '0' / x2 = '1'
      x1 <= '0';
      x2 <= '1';
      wait for 2 ns;
      assert (f = '1') report "tc3 error!";

      -- x1 = '1' / x2 = '1'
      x1 <= '1';
      x2 <= '1';
      wait for 2 ns;
      assert (f = '0') report "tc4 error!";

      report "end of test!";
      wait;
    end process;

end TB;
