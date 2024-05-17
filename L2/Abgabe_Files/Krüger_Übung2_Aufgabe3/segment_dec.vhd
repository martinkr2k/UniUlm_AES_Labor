library ieee;
use ieee.std_logic_1164.all;

entity segment_dec is 
  port (
    sw : in std_logic_vector(9 downto 0);
    hex0 : out std_logic_vector(6 downto 0);
	 ledr : out std_logic_vector(9 downto 0)
  );
end segment_dec;

architecture DATAFLOW of segment_dec is 
  begin
    
    hex0(0) <= not(sw(1) OR sw(3) OR (not(sw(0)) AND not(sw(2))) OR (sw(0) AND sw(2)));
    hex0(1) <= not(not(sw(2)) OR (sw(0) AND sw(1)) OR (not(sw(0)) AND not(sw(1))));
    hex0(2) <= not(sw(0) OR not(sw(1)) OR sw(2) OR sw(3));
    hex0(3) <= not(sw(3) OR (not(sw(0)) AND not(sw(2))) OR (not(sw(0)) AND sw(1)) OR (not(sw(2)) AND sw(1)) OR (sw(0) AND not(sw(1)) AND sw(2)));
    hex0(4) <= not((not(sw(0)) AND not(sw(2))) OR (not(sw(0)) AND sw(1)));
    hex0(5) <= not((not(sw(0)) AND sw(2)) OR (sw(3)) OR (not(sw(1)) AND sw(2) AND not(sw(3))) OR (not(sw(0)) AND not(sw(1)) AND not(sw(3))));
    hex0(6) <= not((not(sw(2)) AND sw(1)) OR (sw(2) AND not(sw(1))) OR sw(3) OR (sw(2) AND not(sw(0))));

	 
	 ledr(0) <= sw(0);
	 ledr(1) <= sw(1);
	 ledr(2) <= sw(2);
	 ledr(3) <= sw(3);
	 
end DATAFLOW;