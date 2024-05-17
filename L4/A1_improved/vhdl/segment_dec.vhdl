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

architecture TEST_OUTP of segment_dec is 
    begin 

      process (p_imp_bin) 
      begin 

        case p_imp_bin is
          when "0000" =>
            report "output: 0";
          when "0001" =>
            report "output: 1";
          when "0010" =>
            report "output: 2";
          when "0011" =>
            report "output: 3";
          when "0100" =>
            report "output: 4";
          when "0101" =>
            report "output: 5";
          when "0110" =>
            report "output: 6";
          when "0111" =>
            report "output: 7";
          when "1000" =>
            report "output: 8";
          when "1001" =>
            report "output: 9";
          when others => 
            report "output: error!";
        end case;

      end process;
  
end TEST_OUTP;

