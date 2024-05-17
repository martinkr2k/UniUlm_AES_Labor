library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity timer_counter is 
    generic (
        G_TIMER_MAX : positive := 10
    );
    port (
        CLOCK_50 : in std_logic;
        COUNT : out std_logic_vector(3 downto 0)
    );
end timer_counter;


architecture BEHAVIOR of timer_counter is
    signal s_pulse : std_logic;
    signal s_tmp_count : unsigned(3 downto 0) := (others => '0');

    begin 

        TIM : entity work.timer(BEHAVIOR) generic map (G_TIMER_MAX) port map (CLOCK_50, s_pulse);

        process(s_pulse)
        begin 
            if (rising_edge(s_pulse)) then 

                s_tmp_count <= s_tmp_count + 1;

                if (s_tmp_count = 9) then 
                    s_tmp_count <= (others => '0');
                end if;

            end if;

        end process;

end BEHAVIOR;