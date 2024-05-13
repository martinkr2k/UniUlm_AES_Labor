library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity timer_counter_tb is
end timer_counter_tb;


architecture TB of timer_counter_tb is 
    signal s_clk, s_pulse : std_logic;
    
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

    --signals    
    constant C_TIMER_MAX : positive := 10;
    constant c_timer_bits : positive := log2ceil(C_TIMER_MAX);
    signal s_timer : unsigned((c_timer_bits - 1) downto 0) := (others => '0');
    signal s_tc : std_logic_vector(3 downto 0);
    
    begin 
        
        TIMER : entity work.timer_counter(BEHAVIOR) generic map (C_TIMER_MAX) port map (s_clk, s_tc);

        process
        begin
           
            -- one second
            for i in 1 to (C_TIMER_MAX * 20) loop
                
                -- clock cycle
                s_clk <= '0';
                wait for 2 ns;
                s_clk <= '1'; 
                wait for 2 ns;

                if (s_pulse = '1') then
                    report "pulse high";
                end if;

            end loop;
    
            report "end of test!";
            wait;

        end process;

end TB;