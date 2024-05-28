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
    signal s_start_processing : std_logic := '0';
    signal s_message : std_logic_vector(31 downto 0) := (others => '0');
    signal s_polynom : std_logic_vector(7 downto 0) := (others => '0');

    signal s_output : std_logic_vector(31 downto 0) := (others => '0');
    signal s_enable : std_logic := '0';
    signal s_in_out : std_logic := '0'; -- 0 = Eingabe / 1 = Ausgabe 
    signal s_mux : std_logic_vector(3 downto 0) := (others => '0');



    begin 

        process (CLOCK_50, KEY, SW) 
        begin 

            if (s_in_out = '1') then 

                if (SW(8) = '0' AND SW(9) = '0') then
                    -- 00 - 07
                    LEDR(7 downto 0) <= s_output(7 downto 0);

                elsif (SW(8) = '1' AND SW(9) = '0') then 
                    -- 08 - 15   
                    LEDR(7 downto 0) <= s_output(15 downto 8);
                
                elsif (SW(8) = '0' AND SW(9) = '1') then 
                    -- 16 - 23
                    LEDR(7 downto 0) <= s_output(23 downto 16); 

                elsif (SW(8) = '1' AND SW(9) = '1') then 
                    -- 24 - 31
                    LEDR(7 downto 0) <= s_output(31 downto 24);
                
                end if; 
            
            else 

                if (SW(8) = '0' AND SW(9) = '0') then
                    -- 00 - 07
                    LEDR(7 downto 0) <= s_message(7 downto 0);

                elsif (SW(8) = '1' AND SW(9) = '0') then 
                    -- 08 - 15   
                    LEDR(7 downto 0) <= s_message(15 downto 8);
                
                elsif (SW(8) = '0' AND SW(9) = '1') then 
                    -- 16 - 23
                    LEDR(7 downto 0) <= s_message(23 downto 16); 

                elsif (SW(8) = '1' AND SW(9) = '1') then 
                    -- 24 - 31
                    LEDR(7 downto 0) <= s_message(31 downto 24);
                
                end if; 

            end if;

            if (KEY(0) = '1') then
                -- -- RESET
                -- s_start_processing <= '1';
                -- s_message <= (others => '0');
                -- s_polynom <= (others => '0');
                -- s_in_out <= '0';
                -- s_mux <= (others => '0');
                
                -- TEMPORARY: SWITCH DISPLAY INPUT/OUTPUT
                if (s_in_out = '0') then 
                    s_in_out <= '1';
                    LEDR(8) <= '1';
                else 
                    s_in_out <= '0';
                    LEDR(9) <= '0';
                end if;
                
            elsif (KEY(1) = '1') then 
                -- START PROCESSING
                s_start_processing <= '1';
            
            elsif (KEY(2) = '1') then
                -- POLYNOM
                LEDR(7 downto 0) <= s_polynom;

                if (KEY(3) = '1') then
                    -- CHANGE POLYNOM
                    s_polynom <= SW(7 downto 0);
                    LEDR(7 downto 0) <= SW(7 downto 0); 
                end if;

            elsif (KEY(3) = '1') then 
                -- EINGABE BESTAETIGEN
                
                if (SW(8) = '0' AND SW(9) = '0') then
                    -- 00 - 07
                    s_message(7 downto 0) <= SW(7 downto 0);
                    LEDR(7 downto 0) <= s_message(7 downto 0);

                elsif (SW(8) = '1' AND SW(9) = '0') then 
                    -- 08 - 15
                    s_message(15 downto 8) <= SW(7 downto 0);
                    LEDR(7 downto 0) <= s_message(15 downto 8);
                
                elsif (SW(8) = '0' AND SW(9) = '1') then 
                    -- 16 - 23
                    s_message(23 downto 16) <= SW(7 downto 0);
                    LEDR(7 downto 0) <= s_message(23 downto 16); 

                elsif (SW(8) = '1' AND SW(9) = '1') then 
                    -- 24 - 31
                    s_message(31 downto 24) <= SW(7 downto 0);
                    LEDR(7 downto 0) <= s_message(31 downto 24);
                
                end if; 
            
            else
                s_start_processing <= '0';
            end if;

        end process;

end BEHAVIOR;