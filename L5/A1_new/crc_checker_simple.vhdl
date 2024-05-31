library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker_simple is 
    port (
        CLOCK_50 : in std_logic;
        SW : in std_logic_vector(9 downto 0);
        KEY : in std_logic_vector(3 downto 0);
        LEDR : out std_logic_vector(9 downto 0)
    );
end crc_checker_simple;


architecture BEHAVIOR of crc_checker_simple is 
        signal s_reset : std_logic := '0';
        signal s_message : std_logic_vector := (others => '0');
        signal s_polynom : std_logic_vector := "10001111";
        signal s_output : std_logic_vector := (others => '0');
        signal s_enable : std_logic := '0';
    begin 

        CRC : entity work.crc_checker(BEHAVIOR) port map (s_reset, s_message, s_polynom, CLOCK_50, s_output, s_enable);

        process (CLOCK_50, SW, KEY)
        begin 

            -- OUTPUT 
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
            
            -- ENABLE
            LEDR(9) <= s_enable;
            
            -- INPUT
            if (SW(8) = '0' AND SW(9) = '0') then
                -- 00 - 07
                s_message(7 downto 0) <= SW(7 downto 0);

            elsif (SW(8) = '1' AND SW(9) = '0') then 
                -- 08 - 15   
                s_message(15 downto 8) <= SW(7 downto 0);
            
            elsif (SW(8) = '0' AND SW(9) = '1') then 
                -- 16 - 23
                s_message(23 downto 16) <= SW(7 downto 0);

            elsif (SW(8) = '1' AND SW(9) = '1') then 
                -- 24 - 31
                s_message(31 downto 24) <= SW(7 downto 0);
            
            end if; 

            -- START PROCESSING
            s_reset <= KEY(1);

        end process;

end BEHAVIOR;