library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity timer_hex_999_tb is
end timer_hex_999_tb;


architecture TB of timer_hex_999_tb is 
    signal G_TIMER_MAX : positive := 10;
    signal s_clk : std_logic;
    signal s_hex0, s_hex1, s_hex2 : std_logic_vector(6 downto 0);

    begin 

        TH : entity work.timer_hex_999(BEHAVIOR) generic map (G_TIMER_MAX) port map (s_clk, s_hex0, s_hex1, s_hex2);

        process
        begin 

            -- one second
            for i in 1 to (G_TIMER_MAX * 2000) loop
                
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