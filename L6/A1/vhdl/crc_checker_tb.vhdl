library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker_tb is 
end crc_checker_tb;


architecture TB of crc_checker_tb is 

        signal s_reset : std_logic := '0';
        signal s_clock : std_logic := '0';
        signal s_address : std_logic := '0';
        signal s_write : std_logic := '0';
        signal s_adr_in : std_logic_vector(31 downto 0) := (others => '0');
        signal s_adr_out : std_logic_vector(31 downto 0) := (others => '0');

        signal s_print_adr : std_logic := '0';

    begin 

        -- CRC : entity work.crc_checker(BEHAVIOR) port map (s_reset, s_clock, s_address, s_write, s_adr_in, s_adr_out);
        CRC : entity work.crc_checker(BEHAVIOR) port map (s_reset, s_clock, s_address, s_write, s_adr_in, s_adr_out);

        process 
        begin
            
            -- Message "11101110111011101110111110000000";
            -- Polynom "11000111000000000000000000000001";
            report "start of test";

            s_clock <= '1';
            s_address <= '0';
            s_write <= '1';
            s_adr_in <= "11101110111011101110111110000000"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11101110111011101110111110000000"; 
            wait for 2 ns;
            report "==== clock cycle 1!";

            s_clock <= '1';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11101110111011101110111110000000"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11101110111011101110111110000000"; 
            wait for 2 ns;
            report "==== clock cycle 2!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '1';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 3!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 4!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 5!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 6!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 7!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 8!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 9!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 10!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 11!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 12!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 13!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 14!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 15!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 16!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 17!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 18!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 19!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 20!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 21!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 22!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 23!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 24!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 25!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 26!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 27!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 28!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 29!";

            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            s_clock <= '0';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001"; 
            wait for 2 ns;
            report "==== clock cycle 30!";
            report "==== OUTPUT:";

            for i in 31 downto 0 loop
                report std_logic'image(s_adr_out(i));
            end loop;

            report "end of test";
            wait;
        end process;
end TB;