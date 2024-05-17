library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity timer_counter_hex_tb is
end timer_counter_hex_tb;


architecture TB of timer_counter_hex_tb is 
    signal s_clk : std_logic;
    signal s_hex0 : std_logic_vector(6 downto 0);
    constant C_TIMER_MAX : positive := 10;
    
    begin 
        
        TCH : entity work.timer_counter_hex(BEHAVIOR_2) generic map (C_TIMER_MAX) port map (s_clk, s_hex0);

        process
        begin
           
            -- one second
            for i in 1 to (C_TIMER_MAX * 20) loop
                
                -- clock cycle
                s_clk <= '0';
                wait for 2 ns;
                s_clk <= '1'; 
                wait for 2 ns;

            end loop;
    
            report "end of test!";
            wait;

        end process;

end TB;