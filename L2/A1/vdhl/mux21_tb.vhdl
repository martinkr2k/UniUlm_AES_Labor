library ieee;
use ieee.std_logic_1164.all;

entity mux21_tb is 
end mux21_tb;

architecture TB of mux21_tb is 
  signal s_sel : std_logic_vector(0 downto 0);
  signal s_inp : std_logic_vector(1 downto 0);
  signal s_out : std_logic;
  begin 
    
    MUX21 : entity work.mux21(DATAFLOW) port map(s_sel, s_inp, s_out);
    process 
    begin 
      
      -- INFO sel = low  -> input(0)
      --      sel = high -> input(1)
      
      -- TC1: sel = low
      s_sel(0) <= '0';
      s_inp(0) <= '0';
      s_inp(1) <= '0';
      wait for 2 ns;
      assert (s_out = '0') report "tc1: case 1 error!";

      s_sel(0) <= '0';
      s_inp(0) <= '1';
      s_inp(1) <= '0';
      wait for 2 ns;
      assert (s_out = '1') report "tc1: case 2 error!";

      s_sel(0) <= '0';
      s_inp(0) <= '0';
      s_inp(1) <= '1';
      wait for 2 ns;
      assert (s_out = '0') report "tc1: case 3 error!";
      
      s_sel(0) <= '0';
      s_inp(0) <= '1';
      s_inp(1) <= '1';
      wait for 2 ns;
      assert (s_out = '1') report "tc1: case 4 error!";

      -- TC2: sel = high
      s_sel(0) <= '1';
      s_inp(0) <= '0';
      s_inp(1) <= '0';
      wait for 2 ns;
      assert (s_out = '0') report "tc2: case 1 error!";
      
      s_sel(0) <= '1';
      s_inp(0) <= '1';
      s_inp(1) <= '0';
      wait for 2 ns;
      assert (s_out = '0') report "tc2: case 2 error!";

      s_sel(0) <= '1';
      s_inp(0) <= '0';
      s_inp(1) <= '1';
      wait for 2 ns;
      assert (s_out = '1') report "tc2: case 3 error!";

      s_sel(0) <= '1';
      s_inp(0) <= '1';
      s_inp(1) <= '1';
      wait for 2 ns;
      assert (s_out = '1') report "tc2: case 4 error!";

      report "end of test!";
      wait;
    end process;
end TB;
