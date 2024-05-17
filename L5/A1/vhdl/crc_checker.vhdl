library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity crc_checker is 
    generic (
        G_POLYNOM : positive := 8;
        G_MESSAGE : positive := 32
    );
    port (
        P_POLYNOM : std_logic_vector( (G_POLYNOM - 1) downto 0);
        P_MESSAGE : std_logic_vector( (G_MESSAGE - 1) downto 0) 
    );
end crc_checker;


architecture BEHAVIOR of crc_checker is 
    begin 





end BEHAVIOR;