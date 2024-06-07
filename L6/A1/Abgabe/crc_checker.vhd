library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker is 
    port (
        CLOCK_50 : in std_logic;
        SW : in std_logic_vector(9 downto 0);
        KEY : in std_logic_vector(3 downto 0);
        LEDR : out std_logic_vector(9 downto 0)
    );
end crc_checker;


architecture BEHAVIOR of crc_checker is 
        signal s_reset : std_logic := '1';
        signal s_address : std_logic := '0';
        signal s_write : std_logic := '0';
        signal s_adr_in : std_logic_vector(31 downto 0) := (others => '0');
        signal s_adr_out : std_logic_vector(31 downto 0) := (others => '0');
    begin 

        CRC : entity work.crc_checker_logic(BEHAVIOR) port map (s_reset, CLOCK_50, s_address, s_write, s_adr_in, s_adr_out);

        -- INPUT HANDLING
        process (KEY)
        begin 
            s_reset <= '0';
            s_write <= '0';
				LEDR(9) <='0';

            -- REACT ON BUTTONS
            if (KEY(0) = '0') then 
                -- RESET
                s_reset <= '1';
			   else 
					 s_reset <= '0';
			   end if;
				
            if (KEY(1) = '0') then 
                -- WRITE
                s_write <= '1';
			   else 
				    s_write <= '0';
			   end if;

            if (KEY(2) = '0') then 
                -- CHOOSE ADDRESS
                    s_address <= '1';
						  LEDR(9) <= '1';
				else 
				    s_address <= '0';
				end if;
						  
						  
            if (KEY(3) = '0') then 
                -- CONFIRM INPUT 
                if (SW(9) = '0' AND SW(8) = '0') then 
                    s_adr_in(7 downto 0) <= SW(7 downto 0);
                    
                elsif (SW(9) = '0'AND SW(8) = '1') then 
                    s_adr_in(15 downto 8) <= SW(7 downto 0);

                elsif (SW(9) = '1'AND SW(8) = '0') then 
                    s_adr_in(23 downto 16) <= SW(7 downto 0);

                elsif (SW(9) = '1'AND SW(8) = '1') then 
                    s_adr_in(31 downto 24) <= SW(7 downto 0);

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

        end process;

end BEHAVIOR;