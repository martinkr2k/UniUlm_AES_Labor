library ieee;
use ieee.std_logic_1164.all;

entity segment_dec is 
  port (
    p_imp_bin : in std_logic_vector(3 downto 0);
    hex0 : out std_logic_vector(6 downto 0)
  );
end segment_dec;

architecture DATAFLOW of segment_dec is 
  begin
    
    hex0(0) <= p_imp_bin(1) OR p_imp_bin(3) OR (not(p_imp_bin(0)) AND not(p_imp_bin(2))) OR (p_imp_bin(0) AND p_imp_bin(2));
    hex0(1) <= not(p_imp_bin(2)) OR (p_imp_bin(0) AND p_imp_bin(1)) OR (not(p_imp_bin(0)) AND not(p_imp_bin(1)));
    hex0(2) <= p_imp_bin(0) OR not(p_imp_bin(1)) OR p_imp_bin(2) OR p_imp_bin(3);
    hex0(3) <= p_imp_bin(3) OR (not(p_imp_bin(0)) AND not(p_imp_bin(2))) OR (not(p_imp_bin(0)) AND p_imp_bin(1)) OR (not(p_imp_bin(2)) AND p_imp_bin(1)) OR (p_imp_bin(0) AND not(p_imp_bin(1)) AND p_imp_bin(2));
    hex0(4) <= (not(p_imp_bin(0)) AND not(p_imp_bin(2))) OR (not(p_imp_bin(0)) AND p_imp_bin(1));
    hex0(5) <= (not(p_imp_bin(0)) AND p_imp_bin(2)) OR (p_imp_bin(3)) OR (not(p_imp_bin(1)) AND p_imp_bin(2) AND not(p_imp_bin(3))) OR (not(p_imp_bin(0)) AND not(p_imp_bin(1)) AND not(p_imp_bin(3)));
    hex0(6) <= (not(p_imp_bin(2)) AND p_imp_bin(1)) OR (p_imp_bin(2) AND not(p_imp_bin(1))) OR p_imp_bin(3) OR (p_imp_bin(2) AND not(p_imp_bin(0)));

end DATAFLOW;
