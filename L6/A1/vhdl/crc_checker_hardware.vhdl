library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker_hardware is 
    port (
        CLOCK_50 : in std_logic;
        SW : in std_logic_vector(9 downto 0);
        KEY : in std_logic_vector(3 downto 0);
        LEDR : out std_logic_vector(9 downto 0)
    );
end crc_checker_hardware;


architecture BEHAVIOR of crc_checker_hardware is 
        signal s_reset : std_logic := '1';
        signal s_address : std_logic := '0';
        signal s_write : std_logic := '0';
        signal s_adr_in : std_logic_vector(31 downto 0);
        signal s_adr_out : std_logic_vector(31 downto 0);
    begin 

        CRC : entity work.crc_checker(BEHAVIOR) port map (s_reset, CLOCK_50, s_address, s_write, s_adr_in, s_adr_out);

        -- INPUT HANDLING
        process (KEY)
        begin 
            s_reset <= '0';
            s_write <= '0';

            -- REACT ON BUTTONS
            if (falling_edge(KEY(0))) then 
                -- RESET
                s_reset <= '1';
                report "reset process";

            elsif (falling_edge(KEY(1))) then 
                -- WRITE
                s_write <= '1';

            elsif (falling_edge(KEY(2))) then 
                -- CHOOSE ADDRESS
                if (s_address = '0') then 
                    s_address <= '1';
                else 
                    s_address <= '0';
                end if;
                report "address process";

            elsif (falling_edge(KEY(3))) then 
                -- CONFIRM INPUT 
                if (SW(9) = '0' AND SW(8) = '0') then 
                    s_adr_in(7 downto 0) <= SW(7 downto 0);
                    report "tmp 1";
                    
                elsif (SW(9) = '0'AND SW(8) = '1') then 
                    s_adr_in(15 downto 8) <= SW(7 downto 0);
                    report "tmp 2";

                elsif (SW(9) = '1'AND SW(8) = '0') then 
                    s_adr_in(23 downto 16) <= SW(7 downto 0);
                    report "tmp 3";

                elsif (SW(9) = '1'AND SW(8) = '1') then 
                    s_adr_in(31 downto 24) <= SW(7 downto 0);
                    report "tmp 4";

                end if;

            end if;

        end process;
        
        -- OUTPUT HANDLING
        process (SW, s_adr_out) 
        begin 
            
            if (SW(9) = '0' AND SW(8) = '0') then 
                LEDR(7 downto 0) <= s_adr_out(7 downto 0);
                
            elsif (SW(9) = '0' AND SW(8) = '1') then 
                LEDR(7 downto 0) <= s_adr_out(15 downto 8);
                
            elsif (SW(9) = '1' AND SW(8) = '0') then 
                LEDR(7 downto 0) <= s_adr_out(23 downto 16);
                
            elsif (SW(9) = '1' AND SW(8) = '1') then 
                LEDR(7 downto 0) <= s_adr_out(31 downto 24); 

            end if;

            report "==== OUTPUT HARDWARE:";
            for i in 31 downto 0 loop
                report std_logic'image(s_adr_out(i));
            end loop;

        end process;

end BEHAVIOR;