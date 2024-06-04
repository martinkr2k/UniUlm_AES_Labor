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
                
                -- LOAD MESSAGE

                s_clock <= '1';
                s_sw <= "1111101110";
                s_key <= "0111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "1111101110";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";
                
                s_clock <= '1';
                s_sw <= "1011101110";
                s_key <= "0111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "1011101110";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";
                         
                s_clock <= '1';
                s_sw <= "0111101111";
                s_key <= "0111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0111101111";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";       
                                         
                s_clock <= '1';
                s_sw <= "0010000000";
                s_key <= "0111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0010000000";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";     
                                         
                s_clock <= '1';
                s_sw <= "0010000000";
                s_key <= "1101";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0010000000";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";     
                
                
                -- LOAD POLYNOM

                s_clock <= '1';
                s_sw <= "1111101110";
                s_key <= "1011";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "1111101110";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";
                
                s_clock <= '1';
                s_sw <= "1111000111";
                s_key <= "0111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "1111000111";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";
                
                s_clock <= '1';
                s_sw <= "1000000000";
                s_key <= "0111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "1000000000";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";
                         
                s_clock <= '1';
                s_sw <= "0100000000";
                s_key <= "0111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0100000000";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";       
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "0111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1101";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle!";      


                -- START PROCESSING
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 1!";      
  
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 2!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 3!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 4!";      
  
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 5!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 6!";      
 
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 7!";      
  
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 8!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 9!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 10!";      
 
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 11!";      
  
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 12!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 13!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 14!";      
 
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 15!";      
  
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 16!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 17!";      
 
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 18!";      
 
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 19!";      
  
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 20!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 21!";      
 
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 22!";      
  
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 23!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 24!";      
 
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 25!";      
  
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 26!";      
                                         
                s_clock <= '1';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                s_clock <= '0';
                s_sw <= "0000000001";
                s_key <= "1111";
                wait for 2 ns;
                report "==== clock cycle 27!";      
                

            report "end of test!";
            wait;
        end process;

end TB;
