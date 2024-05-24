library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity crc_checker_tb is 
end crc_checker_tb;


architecture TB of crc_checker_tb is 
    
    signal P_RESET :  std_logic := '0';
    signal P_MESSAGE : std_logic_vector(31 downto 0) := (others => '1');
    signal P_POLYNOM : std_logic_vector(7 downto 0) := (others => '0');
    signal CLOCK_50 : std_logic := '0';
    
    begin 
        CRC : entity work.crc_checker(BEHAVIOR) port map (P_RESET, P_MESSAGE, P_POLYNOM, CLOCK_50);

        process 
        begin 

            P_RESET <= '1';
            wait for 2 ns;
            report "CLOCK CHANGE";

            P_RESET <= '0';
            wait for 2 ns;
            report "CLOCK CHANGE";






            report "end of test";
            wait;
        end process;

end TB;