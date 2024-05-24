library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY counter999 IS
	PORT (
		CLOCK_50 : IN STD_LOGIC ;
		HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		HEX1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		HEX2 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END counter999;


architecture BEHAVIOR of counter999 is 

	 constant G_TIMER_MAX : integer := 5000000; 
	 signal s_pulse : std_logic;
    signal s_inh0, s_inh1, s_inh2 : std_logic_vector(3 downto 0) := (others => '0');
    begin
        
        TM : entity work.timer(BEHAVIOR) generic map (G_TIMER_MAX) port map (CLOCK_50, s_pulse);
        HX0 : entity work.segment_dec(DATAFLOW) port map (s_inh0, HEX0);
        HX1 : entity work.segment_dec(DATAFLOW) port map (s_inh1, HEX1);
        HX2 : entity work.segment_dec(DATAFLOW) port map (s_inh2, HEX2);

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