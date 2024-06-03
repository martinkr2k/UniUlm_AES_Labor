library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker is 
    port (
        P_RESET :   in std_logic;
        P_CLOCK :   in std_logic;
        P_ADDRESS :  in std_logic;
        P_WRITE :   in std_logic;
        P_ADR_IN :  in std_logic_vector(31 downto 0);

        P_PRINT_ADR : in std_logic;

        P_ADR_OUT : out std_logic_vector(31 downto 0)
    );
end crc_checker;


architecture BEHAVIOR of crc_checker is 

    signal s_adr0_register : std_logic_vector(31 downto 0);
    signal s_adr1_register : std_logic_vector(31 downto 0);
    signal s_processing : std_logic := '0';
    signal s_counter : unsigned(4 downto 0) := "11111";
    signal s_tmp_register : std_logic_vector(31 downto 0);

    begin
        
        process (P_RESET, P_CLOCK, P_WRITE, P_ADR_IN)
        begin 

            if (P_RESET = '1') then 
                -- RESET
                s_adr0_register <= (others => '0');
                s_adr1_register <= (others => '0');
                P_ADR_OUT <= (others => '0'); 
                s_counter <= "11111";
                s_tmp_register <= (others => '0');
                s_processing <= '0';
                report "in reset";
            
            elsif (P_WRITE = '1') then 
                -- WRITE 

                if (P_ADDRESS = '0') then 
                    -- MESSAGE
                    s_adr0_register <= P_ADR_IN;
                    report "in write message";

                elsif (P_ADDRESS = '1') then 
                    -- POLYNOM
                    s_adr1_register <= P_ADR_IN;
                    report "in write polynom";

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
                        report "in processing init";

                    elsif (s_processing = '1') then 

                        if (s_counter = 6) then 
                            -- PROCESSING COMPLETE
                            s_processing <= '0';
                            P_ADR_OUT(31 downto 7) <= s_adr0_register(31 downto 7);
                            P_ADR_OUT(6 downto 0) <= s_tmp_register(6 downto 0);
                            report "in processing complete!";  

                        else 
                            -- PROCESSING STEP
                        
                            -- xor
                            if (s_tmp_register(to_integer(s_counter)) = '1') then
                                s_tmp_register(to_integer(s_counter) downto to_integer(s_counter) - 7) <= 
                                s_tmp_register(to_integer(s_counter) downto to_integer(s_counter) - 7) XOR s_adr1_register(31 downto 24);
                                report "in processing xor!";
                            else 
                                report "in processing no xor!";
                            end if;

                            -- shift
                            s_counter <= s_counter - 1;
                        end if;

                    end if;

                end if;

            end if;

            

            if (P_PRINT_ADR = '1') then 
                
                if (P_ADDRESS = '0') then 
                    for i in 31 downto 0 loop
                        report std_logic'image(s_adr0_register(i));
                    end loop;
                else 
                    for i in 31 downto 0 loop
                        report std_logic'image(s_adr1_register(i));
                    end loop;
                end if;
            end if;

        end process;

end BEHAVIOR;

