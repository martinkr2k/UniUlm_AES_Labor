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
        P_ENABLE : out std_logic;
    );
end crc_checker;


architecture BEHAVIOR of crc_checker is 

    signal s_enable : std_logic := '0';
    signal s_proc_mess : std_logic_vector(31 downto 0) := (others => '0');
    signal s_proc_poly : std_logic_vector(31 downto 0) := (others => '0');

    begin 

        process (CLOCK_50)
        begin

            if (P_RESET = '1') then 
                -- initialization phase

                s_enable <= '1';
                P_ENABLE <= '1'

                for i in 0 to 24 loop 
                    s_proc_mess(i + 7) <= P_MESSAGE(0);
                end loop;

                s_proc_poly(31 downto 24) <= P_POLYNOM;

            else 

                if (s_enable = '1') then
                    -- crc check
                    P_ENABLE <= '1';

                    if (rising_edge(CLOCK_50)) then 

                        if (s_proc_poly(0) = '1') then
                        -- processing 

                        -- XOR


                        -- SHIFT
                        for i in 31 downto 1 loop
                            s_proc_mess(i - 1) <= s_proc_mess(i);
                        end loop;
                        end if;

                    end if;

                end if;

            end if;








        end process;


end BEHAVIOR;