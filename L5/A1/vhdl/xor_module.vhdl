library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity xor_module is
    generic (
        G_LEN : positive := 8
    ); 
    port (
        P_A : in std_logic_vector( (G_LEN - 1) downto 0);
        P_B : in std_logic_vector( (G_LEN - 1) downto 0);
        P_O : out std_logic_vector( (G_LEN - 1) downto 0)
    );
end xor_module;


architecture DATAFLOW of xor_module is 
    begin

        VEC_XOR : for i in 0 to (G_LEN - 1) generate
            P_O(i) <= P_A(i) XOR P_B(i);
        end generate;

end DATAFLOW;