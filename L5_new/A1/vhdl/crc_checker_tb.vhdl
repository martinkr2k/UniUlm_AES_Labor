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
        CRC : entity work.crc_checker(BEHAVIOR) port map (s_reset, s_clock, s_address, s_write, s_adr_in, s_print_adr, s_adr_out);

        process 
        begin
            
            -- Message "11101110111011101110111110000000";
            -- Polynom "11000111000000000000000000000001";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11101110111011101110111110000000";
            wait for 2 ns;
            s_clock <= '0';
            s_write <= '0';
            wait for 2 ns;
            report "---- prepare load of message!";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '0';
            s_write <= '1';
            s_adr_in <= "11101110111011101110111110000000";
            wait for 2 ns;
            s_clock <= '0';
            s_write <= '0';
            wait for 2 ns;
            report "---- load of message on high cycle!";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001";
            wait for 2 ns;
            s_clock <= '0';
            s_write <= '0';
            wait for 2 ns;
            report "---- prepare load of polynom";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001";
            wait for 2 ns;
            s_write <= '1';
            s_clock <= '0';
            wait for 2 ns;
            report "---- load of polynom on low cycle";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001";
            wait for 2 ns;
            s_write <= '0';
            s_clock <= '0';
            wait for 2 ns;
            report "---- clock cycle";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001";
            wait for 2 ns;
            s_write <= '0';
            s_clock <= '0';
            wait for 2 ns;
            report "---- clock cycle";

            s_reset <= '1';
            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001";
            wait for 2 ns;
            s_reset <= '0';
            s_write <= '0';
            s_clock <= '0';
            wait for 2 ns;
            report "---- reset on high cycle";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '1';
            s_write <= '1';
            s_adr_in <= "11000111000000000000000000000001";
            s_print_adr <= '1';
            wait for 2 ns;
            s_print_adr <= '0';
            s_write <= '0';
            s_clock <= '0';
            wait for 2 ns;
            report "---- load polynom on high cycle";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001";
            s_print_adr <= '1';
            wait for 2 ns;
            s_print_adr <= '0';
            s_write <= '0';
            s_clock <= '0';
            wait for 2 ns;
            report "---- clock cycle";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001";
            s_print_adr <= '1';
            wait for 2 ns;
            s_print_adr <= '0';
            s_write <= '0';
            s_clock <= '0';
            wait for 2 ns;
            report "---- clock cycle";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '0';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001";
            s_print_adr <= '0';
            wait for 2 ns;
            s_print_adr <= '0';
            s_write <= '0';
            s_clock <= '0';
            wait for 2 ns;
            report "---- clock cycle";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '0';
            s_write <= '1';
            s_adr_in <= "11101110111011101110111110000000";
            s_print_adr <= '0';
            wait for 2 ns;
            s_print_adr <= '0';
            s_write <= '0';
            s_clock <= '0';
            wait for 2 ns;
            report "---- clock cycle";

            s_reset <= '0';
            s_clock <= '1';
            s_address <= '1';
            s_write <= '0';
            s_adr_in <= "11000111000000000000000000000001";
            s_print_adr <= '1';
            wait for 2 ns;
            s_print_adr <= '0';
            s_write <= '0';
            s_clock <= '0';
            wait for 2 ns;
            report "---- clock cycle";

            report "end of test";
            wait;
        end process;
end TB;