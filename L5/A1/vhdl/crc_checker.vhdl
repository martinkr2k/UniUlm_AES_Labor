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
        CLOCK_50 : in std_logic;
        P_POLYNOM : in std_logic_vector( (G_POLYNOM - 1) downto 0);
        P_MESSAGE : in std_logic_vector( (G_MESSAGE - 1) downto 0) 
    );
end crc_checker;


architecture BEHAVIOR of crc_checker is 

    -- claculate length of timer vector
    function log2ceil(arg : positive) return natural is
        variable tmp : positive     := 1;
        variable log : natural      := 0;
        begin
        
        if arg = 1 then 
            return 0; 
        end if;
        
        while arg > tmp loop
            tmp := tmp * 2;
            log := log + 1;
        end loop;
        
        return log;
    end function;
    
    -- signals
    constant c_counter_bits : positive := log2ceil(G_MESSAGE - G_POLYNOM);
    signal s_counter : unsigned(c_counter_bits downto 0) := (others => '0');
    signal s_enable : std_logic := '0';

    begin 

        process (P_POLYNOM, P_MESSAGE)
        begin
            
            s_counter <= (others => '0');
            s_enable <= '1';

        end process;

        process (CLOCK_50) 
        begin
            if (s_enable = '1') then 
                
                if (rising_edge(CLOCK_50)) then
                    -- calculate 
                else
                    -- shift
                end if;
                
                s_counter <= s_counter + 1;

                if (s_counter = 10) then
                    s_enable <= '0';
                end if;

            end if;
        end process;

end BEHAVIOR;