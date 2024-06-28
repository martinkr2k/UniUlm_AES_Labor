library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker is 
    port (
        P_RESET :   in std_logic;
        P_CLOCK :   in std_logic;
        P_ADDRESS : in std_logic;
        P_WRITE :   in std_logic;
        P_ADR_IN :  in std_logic_vector(31 downto 0);
        P_ADR_OUT : out std_logic_vector(31 downto 0);
        P_ENABLE  : out std_logic
    );
end crc_checker;


architecture BEHAVIOR of crc_checker is 

    signal s_adr0_register : std_logic_vector(31 downto 0) := "11101110111011101110111110000000";
    signal s_adr1_register : std_logic_vector(31 downto 0) := (others => '0');
    signal s_processing    : std_logic := '0';
    signal s_counter       : unsigned(4 downto 0) := "11111";

    begin
        
        process (P_RESET, P_CLOCK, P_WRITE)
        begin 

            if (P_RESET = '1') then 
                -- RESET
                s_adr0_register <= "11101110111011101110111110000000";
                s_adr1_register <= (others => '0');
                P_ADR_OUT <= (others => '0'); 
                s_counter <= "11111";
                s_processing <= '0';
				    P_ENABLE <= '0';
            
            elsif (P_WRITE = '1') then 
                -- WRITE 
					 
                    s_adr1_register <= P_ADR_IN;
                
                -- initialize processing again if new signal is written
                s_processing <= '0';
            
            elsif (s_adr1_register(0) = '1') then 
                -- processing only starts one clock cycle after loading it to register!!

                if (rising_edge(P_CLOCK)) then 

                    if (s_counter = 6) then 
                        -- PROCESSING COMPLETE
                        s_processing <= '0';
                        P_ADR_OUT(6 downto 0) <= s_adr0_register(6 downto 0);
                        s_adr1_register(0) <= '0';
                        P_ENABLE <= '0';

							else 
                            -- PROCESSING STEP
                        
								 -- xor
								 if (s_adr0_register(to_integer(s_counter)) = '1') then
									  s_adr0_register(to_integer(s_counter) downto to_integer(s_counter) - 7) <= 
									  s_adr0_register(to_integer(s_counter) downto to_integer(s_counter) - 7) XOR s_adr1_register(31 downto 24);
								 end if;

										 -- shift
                            s_counter <= s_counter - 1;
                        end if;

 --                   end if;

                end if;

            end if;

        end process;

end BEHAVIOR;