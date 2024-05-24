library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY counter IS
	PORT (
		CLOCK_50 : IN STD_LOGIC ;
		HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END counter;


architecture BEHAVIOR of counter is 
	
	signal s_pulse : std_logic;
   signal s_tmp_count : std_logic_vector(3 downto 0) := (others => '0');
	constant G_TIMER_MAX : integer := 50000000; 

    begin 

        TIM : entity work.timer(BEHAVIOR) generic map (G_TIMER_MAX) port map (CLOCK_50, s_pulse);
        HX0: entity work.segment_dec(DATAFLOW) port map (s_tmp_count, HEX0);

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