library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity timer is
    generic (
        G_TIMER_MAX : positive := 10
    );
    port (
        CLOCK_50 : in std_logic;
        PULSE : out std_logic
    );
end timer; 


architecture BEHAVIOR of timer is 

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
    constant c_timer_bits : positive := log2ceil(G_TIMER_MAX);
    signal s_timer : unsigned(c_timer_bits downto 0) := (others => '0');

    -- process
    begin 

        process (CLOCK_50)
        begin 
            
            if (rising_edge(CLOCK_50)) then 

                if (s_timer = (G_TIMER_MAX - 1)) then
                    -- timer reached 
                    s_timer <= (others => '0');
                    PULSE <= '1';
                else
                    -- timer not yet reached
                    s_timer <= s_timer + 1;
                    PULSE <= '0';
                end if;

            end if;

        end process;

end BEHAVIOR;

