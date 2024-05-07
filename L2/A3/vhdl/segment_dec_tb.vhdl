library ieee;
use ieee.std_logic_1164.all;

entity segment_dec_tb is 
end segment_dec_tb;

architecture TB of segment_dec_tb is 
  signal s_bin : std_logic_vector(3 downto 0) := (others => '0');
  signal s_hex : std_logic_vector(6 downto 0) := (others => '0');
  begin
    
    HEX0 : entity work.segment_dec(DATAFLOW) port map(s_bin, s_hex);
    
    process
    begin

      -- 0
      s_bin <= "0000";
      wait for 2 ns;
      assert( s_hex(0) = '1' ) report "tc '0': error 0!";
      assert( s_hex(1) = '1' ) report "tc '0': error 1!";
      assert( s_hex(2) = '1' ) report "tc '0': error 2!";
      assert( s_hex(3) = '1' ) report "tc '0': error 3!";
      assert( s_hex(4) = '1' ) report "tc '0': error 4!";
      assert( s_hex(5) = '1' ) report "tc '0': error 5!";
      assert( s_hex(6) = '0' ) report "tc '0': error 6!";


      -- 1 
      s_bin <= "0001";
      wait for 2 ns;
      assert( s_hex(0) = '0' ) report "tc '1': error 0!";
      assert( s_hex(1) = '1' ) report "tc '1': error 1!";
      assert( s_hex(2) = '1' ) report "tc '1': error 2!";
      assert( s_hex(3) = '0' ) report "tc '1': error 3!";
      assert( s_hex(4) = '0' ) report "tc '1': error 4!";
      assert( s_hex(5) = '0' ) report "tc '1': error 5!";
      assert( s_hex(6) = '0' ) report "tc '1': error 6!";


      -- 2
      s_bin <= "0010";
      wait for 2 ns;
      assert( s_hex(0) = '1' ) report "tc '2': error 0!";
      assert( s_hex(1) = '1' ) report "tc '2': error 1!";
      assert( s_hex(2) = '0' ) report "tc '2': error 2!";
      assert( s_hex(3) = '1' ) report "tc '2': error 3!";
      assert( s_hex(4) = '1' ) report "tc '2': error 4!";
      assert( s_hex(5) = '0' ) report "tc '2': error 5!";
      assert( s_hex(6) = '1' ) report "tc '2': error 6!";


      -- 3
      s_bin <= "0011";
      wait for 2 ns;
      assert( s_hex(0) = '1' ) report "tc '3': error 0!";
      assert( s_hex(1) = '1' ) report "tc '3': error 1!";
      assert( s_hex(2) = '1' ) report "tc '3': error 2!";
      assert( s_hex(3) = '1' ) report "tc '3': error 3!";
      assert( s_hex(4) = '0' ) report "tc '3': error 4!";
      assert( s_hex(5) = '0' ) report "tc '3': error 5!";
      assert( s_hex(6) = '1' ) report "tc '3': error 6!";


      -- 4
      s_bin <= "0100";
      wait for 2 ns;
      assert( s_hex(0) = '0' ) report "tc '4': error 0!";
      assert( s_hex(1) = '1' ) report "tc '4': error 1!";
      assert( s_hex(2) = '1' ) report "tc '4': error 2!";
      assert( s_hex(3) = '0' ) report "tc '4': error 3!";
      assert( s_hex(4) = '0' ) report "tc '4': error 4!";
      assert( s_hex(5) = '1' ) report "tc '4': error 5!";
      assert( s_hex(6) = '1' ) report "tc '4': error 6!";


      -- 5
      s_bin <= "0101";
      wait for 2 ns;
      assert( s_hex(0) = '1' ) report "tc '5': error 0!";
      assert( s_hex(1) = '0' ) report "tc '5': error 1!";
      assert( s_hex(2) = '1' ) report "tc '5': error 2!";
      assert( s_hex(3) = '1' ) report "tc '5': error 3!";
      assert( s_hex(4) = '0' ) report "tc '5': error 4!";
      assert( s_hex(5) = '1' ) report "tc '5': error 5!";
      assert( s_hex(6) = '1' ) report "tc '5': error 6!";


      -- 6
      s_bin <= "0110";
      wait for 2 ns;
      assert( s_hex(0) = '1' ) report "tc '6': error 0!";
      assert( s_hex(1) = '0' ) report "tc '6': error 1!";
      assert( s_hex(2) = '1' ) report "tc '6': error 2!";
      assert( s_hex(3) = '1' ) report "tc '6': error 3!";
      assert( s_hex(4) = '1' ) report "tc '6': error 4!";
      assert( s_hex(5) = '1' ) report "tc '6': error 5!";
      assert( s_hex(6) = '1' ) report "tc '6': error 6!";


      -- 7
      s_bin <= "0111";
      wait for 2 ns;
      assert( s_hex(0) = '1' ) report "tc '7': error 0!";
      assert( s_hex(1) = '1' ) report "tc '7': error 1!";
      assert( s_hex(2) = '1' ) report "tc '7': error 2!";
      assert( s_hex(3) = '0' ) report "tc '7': error 3!";
      assert( s_hex(4) = '0' ) report "tc '7': error 4!";
      assert( s_hex(5) = '0' ) report "tc '7': error 5!";
      assert( s_hex(6) = '0' ) report "tc '7': error 6!";


      -- 8
      s_bin <= "1000";
      wait for 2 ns;
      assert( s_hex(0) = '1' ) report "tc '8': error 0!";
      assert( s_hex(1) = '1' ) report "tc '8': error 1!";
      assert( s_hex(2) = '1' ) report "tc '8': error 2!";
      assert( s_hex(3) = '1' ) report "tc '8': error 3!";
      assert( s_hex(4) = '1' ) report "tc '8': error 4!";
      assert( s_hex(5) = '1' ) report "tc '8': error 5!";
      assert( s_hex(6) = '1' ) report "tc '8': error 6!";


      -- 9
      s_bin <= "1001";
      wait for 2 ns;
      assert( s_hex(0) = '1' ) report "tc '9': error 0!";
      assert( s_hex(1) = '1' ) report "tc '9': error 1!";
      assert( s_hex(2) = '1' ) report "tc '9': error 2!";
      assert( s_hex(3) = '1' ) report "tc '9': error 3!";
      assert( s_hex(4) = '0' ) report "tc '9': error 4!";
      assert( s_hex(5) = '1' ) report "tc '9': error 5!";
      assert( s_hex(6) = '1' ) report "tc '9': error 6!";


      report "end of test!";
      wait;
    end process;
end TB;
