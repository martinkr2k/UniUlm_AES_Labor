library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_new is 
    port (
        P_RESET :   in std_logic;
        P_CLOCK :   in std_logic;
        P_ADDRESS :  in std_logic;
        P_WRITE :   in std_logic;
        P_ADR_IN :  in std_logic_vector(31 downto 0);
        P_ADR_OUT : out std_logic_vector(31 downto 0)
    );
end crc_new;


architecture BEHAVIOR of crc_new is 

    signal s_adr0_register : std_logic_vector(31 downto 0) := (others => '0');
    signal s_adr1_register : std_logic_vector(31 downto 0) := (others => '0');
    signal s_processing : std_logic := '0';
    signal s_counter : unsigned(4 downto 0) := "11111";
    signal s_tmp_register : std_logic_vector(31 downto 0) := (others => '0');

    begin
        
        process (P_RESET, P_CLOCK, P_WRITE, P_ADR_IN)
        begin 
		
            if (P_RESET = '0') then 
                -- RESET
                s_adr0_register <= (others => '0');
                s_adr1_register <= (others => '0');
                P_ADR_OUT <= (others => '0'); 
                s_counter <= "11111";
                s_tmp_register <= (others => '0');
                s_processing <= '0';
            
            elsif (P_WRITE = '1') then 
                -- WRITE 

                if (P_ADDRESS = '0') then 
                    -- MESSAGE
                    s_adr0_register <= P_ADR_IN;

                elsif (P_ADDRESS = '1') then 
                    -- POLYNOM
                    s_adr1_register <= P_ADR_IN;
                end if;
                
                -- initialize processing again if new signal is written
                s_processing <= '0';
            
            elsif (s_adr1_register(0) = '1') then 
                -- processing only starting one clock cycle after loading it to register!!
			
                if (rising_edge(P_CLOCK)) then 				
                
                    if (s_processing = '0') then 
                        -- INITIAL
                        s_processing <= '1';
                        s_counter <= "11111";
                        s_tmp_register <= s_adr0_register;

                    elsif (s_processing = '1') then 

                        if (s_counter = 6) then 
                            -- PROCESSING COMPLETE
                            s_processing <= '0';
                            P_ADR_OUT(31 downto 7) <= s_adr0_register(31 downto 7);
                            P_ADR_OUT(6 downto 0) <= s_tmp_register(6 downto 0);
                            s_adr1_register(0) <= '0';

                        else 
                            -- PROCESSING STEP
                        
                            -- xor
                            if (s_tmp_register(to_integer(s_counter)) = '1') then
                                s_tmp_register(to_integer(s_counter) downto to_integer(s_counter) - 7) <= 
                                s_tmp_register(to_integer(s_counter) downto to_integer(s_counter) - 7) XOR s_adr1_register(31 downto 24);
                            end if;

                            -- shift
                            s_counter <= s_counter - 1;
                        end if;

                    end if;

                end if;

            end if;
			
			if (P_ADDRESS = '0') then 
				P_ADR_OUT(31 downto 7) <= s_adr0_register(31 downto 7);
				P_ADR_OUT(6 downto 0) <= s_tmp_register(6 downto 0);
			else 
				P_ADR_OUT(31 downto 0) <= s_adr1_register(31 downto 0);
			end if;
			
        end process;

end BEHAVIOR;