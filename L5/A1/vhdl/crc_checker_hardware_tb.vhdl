library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker_hardware_tb is 
end crc_checker_hardware_tb;


architecture TB of crc_checker_hardware_tb is 

        signal s_clock : std_logic := '0';
        signal s_sw : std_logic_vector(9 downto 0) := (others => '0');
        signal s_key : std_logic_vector(3 downto 0) := (others => '1');
        signal s_ledr : std_logic_vector(9 downto 0) := (others => '0');

    begin 

        CRCH : entity work.crc_checker_hardware(BEHAVIOR) port map (s_clock, s_sw, s_key, s_ledr);

        process 
        begin 
            report "start of test!";
    
                -- Message "11101110111011101110111110000000";
                -- Polynom "11000111000000000000000000000001";
                --

                s_clock <= '1';
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";

                s_clock <= '1';
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle - START PROCESSING NOW!";


                ---- WRITE
                s_clock <= '1';
                s_key <= "1101";
                wait for 2 ns;
                s_clock <= '0';
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";

                s_clock <= '1';
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";

                for i in 25 downto 0 loop

                    s_clock <= '1';
                    s_key <= "1111";
                    wait for 2 ns;
                    s_clock <= '0';
                    s_key <= "1111";
                    wait for 2 ns;
                    report "==== clock cycle!";

                end loop;

                report "end of test!";
                wait;
        
        end process;

end TB;