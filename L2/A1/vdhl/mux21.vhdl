library ieee;
use ieee.std_logic_1164.all;

entity mux21 is 
  port (
    p_sel : in std_logic_vector(0 downto 0);
    p_inp : in std_logic_vector(1 downto 0);
    p_out : out std_logic
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
    
    p_out <= (not(p_sel(0)) AND p_inp(0)) OR (p_sel(0) AND p_inp(1));

end DATAFLOW;
