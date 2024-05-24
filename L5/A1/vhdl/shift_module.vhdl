library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity shift_module is
    generic (
        G_LEN : positive := 8
    );
    port (
        P_IN : in unsigned( (G_LEN - 1) downto 0);
        P_SHIFT : in positive;
        P_OUT : out unsigned( (G_LEN - 1) downto 0) := (others => '0')
    );
end shift_module;


architecture BEHAIVOR_LS of shift_module is
    begin 

        process (P_IN, P_SHIFT)
        begin
            
            P_OUT <= shift_left(P_IN, 1);

        end process;

end BEHAVIOR_LS;


architecture BEHAIVOR_RS of shift_module is
    begin 

        process (P_IN, P_SHIFT)
        begin
            
            P_OUT <= right_shift(P_IN, 1);

        end process;

end BEHAVIOR_LS;