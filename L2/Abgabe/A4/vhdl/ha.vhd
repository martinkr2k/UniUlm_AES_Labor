library ieee;
use ieee.std_logic_1164.all;

entity ha is 
  port(
    p_a : in std_logic;
    p_b : in std_logic;
    p_s : out std_logic;
    p_c : out std_logic
  );
end ha;


architecture DATAFLOW of ha is 
  begin
    
    p_s <= p_a XOR p_b;
    p_c <= p_a AND p_b; 

end DATAFLOW;