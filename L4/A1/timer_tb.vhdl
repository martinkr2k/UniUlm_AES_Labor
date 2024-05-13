library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity timer_tb is
end timer_tb;


architecture TB of timer_tb is 
    signal s_clk : std_logic;
    --signal s_timer : std_logic_vector(24 downto 0) := (others => '0');
    signal s_pulse : std_logic;
    begin 

        TM : entity work.timer(BEHAVIOR) port map(s_clk, s_pulse);
        
        process 
            begin 

                for k in 60009 downto 0 loop
                    
                    -- clock cycle
                    s_clk <= '0';
                    wait for 2 ns;
                    s_clk <= '1';
                    wait for 2 ns;

                    if (s_pulse = '1') then
                        report "timer reached!";
                    end if;
                end loop;
                
                --for i in 24 downto 0 loop
                --    report std_logic'image(s_timer(i));
                --end loop;

                report "end of test!";
            wait;
        end process;
end TB;

