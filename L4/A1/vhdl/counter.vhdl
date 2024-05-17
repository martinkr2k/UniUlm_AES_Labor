library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is 
    port (
        clock_50 : in std_logic;
        hex0 : out std_logic_vector(6 downto 0)
    );
end counter;


architecture BEHAVIOR of counter is 
    signal s_count : std_logic_vector(3 downto 0);
    signal s_pulse : std_logic;
    begin 

        TIMER : entity work.timer(BEHAVIOR) port map(clock_50, s_pulse);
        HEX : entity work.segment_dec(DATAFLOW) port map(s_count, hex0);

        process(s_pulse)
        begin

            if (rising_edge(s_pulse)) then
                s_count <= s_count + 1;
                
                if (s_count = 10) then
                    s_count <= (others => '0');
                end if;
            end if;

        end process;

end BEHAVIOR;