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
        signal s_reset : std_logic := '0';
        signal s_address : std_logic := '0';
        signal s_write : std_logic := '0';
        signal s_adr_in : std_logic_vector(31 downto 0);
        signal s_adr_out : std_logic_vector(31 downto 0);
    begin 

        CRC : work.crc_checker(BEHAVIOR) port map (s_reset, CLOCK_50, s_address, s_write, s_adr_in, s_adr_out);

        process (KEY)
        begin
            
            -- REACT ON BUTTONS
            if (falling_edge(KEY(0))) then 
            
            elsif (falling_edge(KEY(1))) then 

            elsif (falling_edge(KEY(2))) then 

            elsif (falling_edge(KEY(3))) then 
            
            end if;

        end process;

end BEHAVIOR;