library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker_init is 
    generic (
        G_POLYNOM : positive := 8;
        G_MESSAGE : positive := 32
    );
    port (
        P_MESSAGE : in std_logic_vector( (G_MESSAGE - 1) downto 0); 
        P_POLYNOM : in std_logic_vector( (G_POLYNOM - 1) downto 0);
        P_OUTPUT : out std_logic_vector( (G_MESSAGE - 1) downto 0);
        P_ENABLE : out std_logic
    );
end crc_checker_init;


architecture BEHAVIOR of crc_checker_init is 
    begin 

        process (P_MESSAGE, P_POLYNOM)
        begin




        

        end process;

end BEHAVIOR;