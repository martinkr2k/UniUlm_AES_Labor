library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity shift_module is
    generic (
        G_LEN : positive := 8
    );
    port (
        P_SHIFT_SIGNAL : std_logic;
        P_IN : in unsigned( (G_LEN - 1) downto 0);
        P_SHIFT : in positive;
        P_SHIFT_TYPE : in std_logic_vector (1 downto 0);
        P_OUT : out unsigned( (G_LEN - 1) downto 0) := (others => '0')
    );
end shift_module;


architecture BEHAVIOR of shift_module is 
    begin
        
        process (P_IN, P_SHIFT, P_SHIFT_TYPE)
        begin

            if (rising_edge(P_SHIFT_SIGNAL)) then 
        
                if (P_SHIFT_TYPE = "00") then 
                    -- logical left  
                    P_OUT <= shift_left(P_IN, P_SHIFT);
                    
                elsif (P_SHIFT_TYPE = "01") then 
                    -- logical right  
                    P_OUT <= shift_right(P_IN, P_SHIFT);
            
                elsif (P_SHIFT_TYPE = "01") then 
                    -- arithmretic left 
                
                
                elsif (P_SHIFT_TYPE = "01") then 
                    -- arithmetic right 
            
            
                end if;

            end if;

        
        end process;

end BEHAVIOR;