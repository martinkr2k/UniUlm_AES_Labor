library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker is 
    port (
        P_RESET : in std_logic;
        P_MESSAGE : in std_logic_vector(31 downto 0);
        P_POLYNOM : in std_logic_vector(7 downto 0);
        CLOCK_50 : in std_logic;

        P_OUTPUT : out std_logic_vector(31 downto 0);
        P_ENABLE : out std_logic
    );
end crc_checker;


architecture BEHAVIOR of crc_checker is 

    signal s_processing : std_logic := '0';
    signal s_proc_mess : std_logic_vector(31 downto 0) := (others => '0');
    signal s_counter_top : unsigned(4 downto 0) := (others => '1');
    signal S_counter_bot : unsigned(4 downto 0) := (others => '1');
    signal s_in_xor : std_logic := '1';


    begin 

        process (CLOCK_50)
        begin

            if (P_RESET = '1') then 
                -- INITIALISATION
               
                -- init counter 
                s_counter_top <= (others => '1');
                s_counter_bot <= "11000";
                
                -- init processing message
                for i in 0 to 24 loop 
                    s_proc_mess(i + 7) <= P_MESSAGE(i);
                end loop;
            
                -- init enable signals
                s_processing <= '1';
                P_ENABLE <= '1';

                P_OUTPUT <= (others => '0');
                
                report "in init!";
            else 

                if (rising_edge(CLOCK_50)) then

                    if (s_processing = '0') then
                        -- FINISH PROCESSING

                        P_ENABLE <= '0';
                        P_OUTPUT <= (others => '0');
                        P_OUTPUT(31 downto 7) <= P_MESSAGE(24 downto 0);
                        P_OUTPUT(6 downto 0) <= s_proc_mess(6 downto 0);
                        report "COMPLETED!!";

                    else 
                        -- PROCESSING STEP 
                        --report "in processing!";

                        -- XOR 
                        if (s_proc_mess(to_integer(s_counter_top)) = '1') then
                            s_proc_mess(to_integer(s_counter_top) downto to_integer(s_counter_bot)) <= s_proc_mess(to_integer(s_counter_top) downto to_integer(s_counter_bot)) XOR P_POLYNOM;
                            s_in_xor <= '1';
                        else
                            s_in_xor <= '0';
                        end if;

                        -- update pointers
                        if (s_counter_bot = 0) then
                            s_processing <= '0';
                        else 
                            --report integer'image(to_integer(s_counter_top - 1));
                            --report integer'image(to_integer(S_counter_bot - 1));
                            
                            s_counter_top <= s_counter_top - 1;
                            s_counter_bot <= s_counter_bot - 1;
                        end if;

                    end if;
                else 
                   
                    --if (s_processing = '1') then
                    --    if (s_in_xor = '1') then
                    --        for i in 31 downto 0 loop
                    --            report std_logic'image(s_proc_mess(i));
                    --        end loop;
                    --    end if;
                    --end if;

                end if;

            end if;

        end process;


end BEHAVIOR;