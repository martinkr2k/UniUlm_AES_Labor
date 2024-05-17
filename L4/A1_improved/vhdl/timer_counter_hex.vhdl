library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity timer_counter_hex is 
    generic (
        G_TIMER_MAX : positive := 10
    );
    port (
        CLOCK_50 : in std_logic;
        HEX0 : out std_logic_vector(6 downto 0)
    );
end timer_counter_hex;

architecture BEHAVIOR of timer_counter_hex is 
    signal s_pulse : std_logic;
    signal s_count : std_logic_vector(3 downto 0);
    begin 
        
        TC : entity work.timer_counter(BEHAVIOR) generic map (G_TIMER_MAX) port map (CLOCK_50, s_count);
        HX0: entity work.segment_dec(TEST_OUTP) port map (s_count, HEX0);

end BEHAVIOR;


architecture BEHAVIOR_2 of timer_counter_hex is

    signal s_pulse : std_logic;
    signal s_tmp_count : std_logic_vector(3 downto 0) := (others => '0');

    begin 

        TIM : entity work.timer(BEHAVIOR) generic map (G_TIMER_MAX) port map (CLOCK_50, s_pulse);
        HX0: entity work.segment_dec(TEST_OUTP) port map (s_tmp_count, HEX0);

        process(s_pulse)
        begin 
            if (rising_edge(s_pulse)) then 

                s_tmp_count <= s_tmp_count + 1;

                if (s_tmp_count = 9) then 
                    s_tmp_count <= (others => '0');
                end if;

            end if;

        end process;

end BEHAVIOR_2;