library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity timer is 
    port (
        p_clock_50 : in std_logic;
        --p_timer_out : out std_logic_vector(24 downto 0);
        p_pulse : out std_logic
    );
end timer;


architecture BEHAVIOR of timer is

    constant timer_max : positive := 60 * 100;
    signal timer_us : std_logic_vector(24 downto 0) := (others => '0');

    begin 

        process (p_clock_50)
        begin 

            if (rising_edge(p_clock_50)) then
                timer_us <= timer_us + 1;
                --p_timer_out <= timer_us;
                if (timer_us = timer_max) then
                    p_pulse <= '1'; 
                    timer_us <= (others => '0'); 
                else 
                    p_pulse <= '0';
                end if;
            end if; 

        end process;

end BEHAVIOR;

--  ghdl -a --ieee=synopsys -fexplicit timer.vhdl
--  ghdl -a --ieee=synopsys -fexplicit timer_tb.vhdl
--  ghdl -e --ieee=synopsys -fexplicit timer_tb
--  ghdl -r --ieee=synopsys -fexplicit timer_tb