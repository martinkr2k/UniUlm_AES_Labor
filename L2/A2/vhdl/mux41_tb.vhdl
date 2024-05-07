library ieee;
use ieee.std_logic_1164.all;

entity mux41_tb is 
end mux41_tb;

architecture TB of mux41_tb is 
  signal sw : std_logic_vector(9 downto 0) := (others => '0');
  signal ledr : std_logic_vector(9 downto 0) := (others => '0');
  begin 
    
    MUX41 : entity work.mux41(DATAFLOW) port map(sw, ledr);

    process begin 
    
      -- TC1       
      -- sel
      sw(8) <= '0';
      sw(9) <= '0';
      -- inp 
      sw(0) <= '0';
      sw(1) <= '0';
      sw(2) <= '0';
      sw(3) <= '0';
      sw(4) <= '0';
      sw(5) <= '0';
      sw(6) <= '0';
      sw(7) <= '0';
      wait for 2 ns;
      assert( (ledr(0) = '0' AND 
	      ledr(1) = '0' AND 
	      ledr(2) = '0' AND  
	      ledr(3) = '0' AND 
	      ledr(4) = '0' AND 
	      ledr(5) = '0' AND
	      ledr(6) = '0' AND
	      ledr(7) = '0') ) report "tc1: case 1 error!";

      -- sel
      sw(8) <= '0';
      sw(9) <= '0';
      -- inp 
      sw(0) <= '1';
      sw(1) <= '1';
      sw(2) <= '0';
      sw(3) <= '0';
      sw(4) <= '0';
      sw(5) <= '0';
      sw(6) <= '0';
      sw(7) <= '0';
      wait for 2 ns;
      assert( (ledr(0) = '1' AND 
	      ledr(1) = '1' AND 
	      ledr(2) = '0' AND  
	      ledr(3) = '0' AND 
	      ledr(4) = '0' AND 
	      ledr(5) = '0' AND
	      ledr(6) = '0' AND
	      ledr(7) = '0') ) report "tc1: case 2 error!";
      
      
      -- TC2
      -- sel
      sw(8) <= '0';
      sw(9) <= '1';
      -- inp 
      sw(0) <= '0';
      sw(1) <= '0';
      sw(2) <= '0';
      sw(3) <= '0';
      sw(4) <= '0';
      sw(5) <= '0';
      sw(6) <= '0';
      sw(7) <= '0';
      wait for 2 ns;
      assert( (ledr(0) = '0' AND 
	      ledr(1) = '0' AND 
	      ledr(2) = '0' AND  
	      ledr(3) = '0' AND 
	      ledr(4) = '0' AND 
	      ledr(5) = '0' AND
	      ledr(6) = '0' AND
	      ledr(7) = '0') ) report "tc2: case 1 error!";

      -- sel
      sw(8) <= '0';
      sw(9) <= '1';
      -- inp 
      sw(0) <= '0';
      sw(1) <= '0';
      sw(2) <= '1';
      sw(3) <= '1';
      sw(4) <= '0';
      sw(5) <= '0';
      sw(6) <= '0';
      sw(7) <= '0';
      wait for 2 ns;
      assert( (ledr(0) = '0' AND 
	      ledr(1) = '0' AND 
	      ledr(2) = '1' AND  
	      ledr(3) = '1' AND 
	      ledr(4) = '0' AND 
	      ledr(5) = '0' AND
	      ledr(6) = '0' AND
	      ledr(7) = '0') ) report "tc2: case 2 error!";

      
      -- TC3
      -- sel
      sw(8) <= '1';
      sw(9) <= '0';
      -- inp 
      sw(0) <= '0';
      sw(1) <= '0';
      sw(2) <= '0';
      sw(3) <= '0';
      sw(4) <= '0';
      sw(5) <= '0';
      sw(6) <= '0';
      sw(7) <= '0';
      wait for 2 ns;
      assert( (ledr(0) = '0' AND 
	      ledr(1) = '0' AND 
	      ledr(2) = '0' AND  
	      ledr(3) = '0' AND 
	      ledr(4) = '0' AND 
	      ledr(5) = '0' AND
	      ledr(6) = '0' AND
	      ledr(7) = '0') ) report "tc3: case 1 error!";

      -- sel
      sw(8) <= '1';
      sw(9) <= '0';
      -- inp 
      sw(0) <= '0';
      sw(1) <= '0';
      sw(2) <= '0';
      sw(3) <= '0';
      sw(4) <= '1';
      sw(5) <= '1';
      sw(6) <= '0';
      sw(7) <= '0';
      wait for 2 ns;
      assert( (ledr(0) = '0' AND 
	      ledr(1) = '0' AND 
	      ledr(2) = '0' AND  
	      ledr(3) = '0' AND 
	      ledr(4) = '1' AND 
	      ledr(5) = '1' AND
	      ledr(6) = '0' AND
	      ledr(7) = '0') ) report "tc3: case 2 error!";


      -- TC4
      -- sel
      sw(8) <= '1';
      sw(9) <= '1';
      -- inp 
      sw(0) <= '0';
      sw(1) <= '0';
      sw(2) <= '0';
      sw(3) <= '0';
      sw(4) <= '0';
      sw(5) <= '0';
      sw(6) <= '0';
      sw(7) <= '0';
      wait for 2 ns;
      assert( (ledr(0) = '0' AND 
	      ledr(1) = '0' AND 
	      ledr(2) = '0' AND  
	      ledr(3) = '0' AND 
	      ledr(4) = '0' AND 
	      ledr(5) = '0' AND
	      ledr(6) = '0' AND
	      ledr(7) = '0') ) report "tc1: case 1 error!";

      -- sel
      sw(8) <= '1';
      sw(9) <= '1';
      -- inp 
      sw(0) <= '0';
      sw(1) <= '0';
      sw(2) <= '0';
      sw(3) <= '0';
      sw(4) <= '0';
      sw(5) <= '0';
      sw(6) <= '1';
      sw(7) <= '1';
      wait for 2 ns;
      assert( (ledr(0) = '0' AND 
	      ledr(1) = '0' AND 
	      ledr(2) = '0' AND  
	      ledr(3) = '0' AND 
	      ledr(4) = '0' AND 
	      ledr(5) = '0' AND
	      ledr(6) = '1' AND
	      ledr(7) = '1') ) report "tc1: case 2 error!";


--      report std_logic'image(ledr(0));
--      report std_logic'image(ledr(1));
--      report std_logic'image(ledr(2));
--      report std_logic'image(ledr(3));
--      report std_logic'image(ledr(4));
--      report std_logic'image(ledr(5));
--      report std_logic'image(ledr(6));
--      report std_logic'image(ledr(7));
--      report std_logic'image(ledr(8));
--      report std_logic'image(ledr(9));

      report "end of test!";
      wait;
    end process;
end TB;
