library ieee;
use ieee.std_logic_1164.all;

entity mux42 is 
  port (
    sw : in std_logic_vector(9 downto 0);
    ledr : out std_logic_vector(9 downto 0)
  );
end mux42;

architecture DATAFLOW of mux42 is 
  begin 
    
-- INFO: SELECTORS: sw(8) & sw(9)
--       INPUTS:    sw(67) & sw(45) & sw(23) & sw(01)
--
-- WIRING: sw(8) | sw(9) | selected output
--            0  |    0  | sw(01)
--            0  |    1  | sw(23)
--            1  |    0  | sw(45)
--            1  |    1  | sw(67)

--    ledr(0) <= not(sw(8)) AND not(sw(9)) AND sw(0);
--    ledr(1) <= not(sw(8)) AND not(sw(9)) AND sw(1);
--    
--    ledr(2) <= not(sw(8)) AND sw(9) AND sw(2);
--    ledr(3) <= not(sw(8)) AND sw(9) AND sw(3);
--
--    ledr(4) <= sw(8) AND not(sw(9)) AND sw(4);
--    ledr(5) <= sw(8) AND not(sw(9)) AND sw(5);

--    ledr(6) <= sw(8) AND sw(9) AND sw(6);
--    ledr(7) <= sw(8) AND sw(9) AND sw(7);
	 
	 ledr(0) <= sw(0);
	 ledr(1) <= sw(1);
	 ledr(2) <= sw(2);
	 ledr(3) <= sw(3);
	 ledr(4) <= sw(4);
	 ledr(5) <= sw(5);
	 ledr(6) <= sw(6);
	 ledr(7) <= sw(7);
	 
	 ledr(8) <= (not(sw(8)) AND not(sw(9)) AND sw(0)) OR 
					(not(sw(8)) AND sw(9) AND sw(2)) OR
					(sw(8) AND not(sw(9)) AND sw(4)) OR
					(sw(8) AND sw(9) AND sw(6));
	
	 ledr(9) <= (not(sw(8)) AND not(sw(9)) AND sw(1)) OR 
					(not(sw(8)) AND sw(9) AND sw(3)) OR 
					(sw(8) AND not(sw(9)) AND sw(5)) OR
					(sw(8) AND sw(9) AND sw(7));
	 

end DATAFLOW;