library ieee;
use ieee.std_logic_1164.all;

entity mux21 is 
  port (
    SW : in std_logic_vector(9 downto 0);
    ledr : out std_logic_vector(9 downto 0)
  );
end mux21;


--  sl | i0 | i1 | o
--   0 |  0 |  0 | 0
--   0 |  0 |  1 | 0
--   0 |  1 |  0 | 1
--   0 |  1 |  1 | 1
--   1 |  0 |  0 | 0
--   1 |  0 |  1 | 1
--   1 |  1 |  0 | 0
--   1 |  1 |  1 | 1
 
architecture DATAFLOW of mux21 is 
  begin 
    
    ledr(0) <= (not(SW(0)) AND SW(1)) OR (SW(0) AND SW(2));

end DATAFLOW;