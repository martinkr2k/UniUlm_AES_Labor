library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity crc_checker_tb is 
end crc_checker_tb;


architecture TB of crc_checker_tb is 
    
    signal P_RESET :  std_logic := '0';
    signal P_MESSAGE : std_logic_vector(31 downto 0) := "00000001110111011101110111011111";
    signal P_POLYNOM : std_logic_vector(7 downto 0) := "11000111"; 
    signal S_ENABLE : std_logic := '0';
    signal S_OUTPUT : std_logic_vector(31 downto 0) := (others => '0');
    signal CLOCK_50 : std_logic := '0';
    
    begin 
        CRC : entity work.crc_checker(BEHAVIOR) port map (P_RESET, P_MESSAGE, P_POLYNOM, CLOCK_50, S_OUTPUT, S_ENABLE);

        process 
        begin

            CLOCK_50 <= '1';
            P_RESET <= '1';
            wait for 2 ns;
            
            CLOCK_50 <= '0';
            P_RESET <= '0';
            wait for 2 ns;
            report "RESET";

            proc_loop: for i in 40 downto 0 loop
                
                CLOCK_50 <= '1';
                wait for 2 ns; 
                
                CLOCK_50 <= '0';
                wait for 2 ns;
                report "CLOCK CYCLE";

                if not (S_OUTPUT = "00000000000000000000000000000000") then 

                    for a in 31 downto 0 loop
                        report std_logic'image(S_OUTPUT(a));
                    end loop;

                    exit proc_loop;
                end if;

            end loop proc_loop;

            report "end of test";
            wait;
        end process;

end TB;