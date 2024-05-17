library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity timer_hex_999 is
    generic (
        G_TIMER_MAX : positive := 10
    );
    port (
        CLOCK_50 : in std_logic;
        HEX0 : out std_logic_vector(6 downto 0);
        HEX1 : out std_logic_vector(6 downto 0);
        HEX2 : out std_logic_vector(6 downto 0)
    );
end timer_hex_999;


architecture BEHAVIOR of timer_hex_999 is 
    signal s_pulse : std_logic;
    signal s_inh0, s_inh1, s_inh2 : std_logic_vector(3 downto 0) := (others => '0');
    begin
        
        TM : entity work.timer(BEHAVIOR) generic map (G_TIMER_MAX) port map (CLOCK_50, s_pulse);
        HX0 : entity work.segment_dec(TEST_OUTP) port map (s_inh0, HEX0);
        HX1 : entity work.segment_dec(TEST_OUTP) port map (s_inh1, HEX1);
        HX2 : entity work.segment_dec(TEST_OUTP) port map (s_inh2, HEX2);
        --HX0 : entity work.segment_dec(DATAFLOW) port map (s_inh0, HEX0);
        --HX1 : entity work.segment_dec(DATAFLOW) port map (s_inh1, HEX1);
        --HX2 : entity work.segment_dec(DATAFLOW) port map (s_inh2, HEX2);

        process (s_pulse)
        begin 

            if (rising_edge(s_pulse)) then
                
                s_inh0 <= s_inh0 + 1;

                if (s_inh0 = 9) then 
                    s_inh0 <= (others => '0');
                    s_inh1 <= s_inh1 + 1;
                    
                    if (s_inh1 = 9) then
                        s_inh1 <= (others => '0');
                        s_inh2 <= s_inh2 + 1;

                        if (s_inh2 = 9) then 
                            s_inh2 <= (others => '0');
                        end if;
                    end if;
                end if;
            end if;

        end process;

end BEHAVIOR;