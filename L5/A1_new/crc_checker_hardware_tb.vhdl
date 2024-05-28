library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker_hardware_tb is
end crc_checker_hardware_tb;


architecture TB of crc_checker_hardware_tb is 

    signal CLOCK_50 : std_logic := '0';
    signal SW : std_logic_vector(9 downto 0) := (others => '0');
    signal KEY : std_logic_vector(3 downto 0) := (others => '0');
    signal LEDR : std_logic_vector(9 downto 0) := (others => '0');

    begin 
        CRCH : entity work.crc_checker_hardware(BEHAVIOR) port map (CLOCK_50, SW, KEY, LEDR); 
        process 
        begin 

            -- neue Eingabe, aber nicht bestaetigt
            SW(7 downto 0) <= "00001111";
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 1: COMPLETE";

            KEY(3) <= '1';
            wait for 2 ns;
            KEY(3) <= '0';
            SW(7 downto 0) <= "11110000";
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 2: COMPLETE";

            KEY(3) <= '1';
            wait for 2 ns;
            KEY(3) <= '0';
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 3: COMPLETE";

            SW(7 downto 0) <= "11001100";
            SW(9 downto 8) <= "01";
            KEY(3) <= '1';
            wait for 2 ns;
            KEY(3) <= '0';
            SW(9 downto 8) <= "00";
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 4: COMPLETE";

            SW(9 downto 8) <= "01";
            wait for 2 ns;
            KEY(3) <= '0';
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 5: COMPLETE";

            KEY(0) <= '1';
            wait for 2 ns;
            KEY(0) <= '0';
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 6: COMPLETE";

            KEY(0) <= '1';
            wait for 2 ns;
            KEY(0) <= '0';
            SW(9 downto 8) <= "11";
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            
            SW(9 downto 8) <= "10";
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;

            SW(9 downto 8) <= "01";
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;

            SW(9 downto 8) <= "00";
            wait for 2 ns;

            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 7: COMPLETE";

            KEY(2) <= '1';
            wait for 2 ns;
            
            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 8: COMPLETE";

            KEY(2) <= '0';
            SW(7 downto 0) <= "11111111";
            wait for 2 ns;
            
            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 9: COMPLETE";

            KEY(2) <= '1';
            KEY(3) <= '1';
            wait for 2 ns;
            
            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 10: COMPLETE";

            KEY(2) <= '0';
            wait for 2 ns;
            
            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 11: COMPLETE";

            KEY(2) <= '1';
            wait for 2 ns;
            
            for i in 7 downto 0 loop
                report std_logic'image(LEDR(i));
            end loop;
            report "TC 12: COMPLETE";









            report "end of test!";
            wait;
        end process;

end TB;