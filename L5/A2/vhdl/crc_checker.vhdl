library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker is 
    generic (
        G_POLYNOM : positive := 8;
        G_MESSAGE : positive := 32
    );
    port (
        P_CLOCK_50 : in std_logic;
        P_RESET : in std_logic;
        P_MESSAGE : in std_logic_vector( (G_MESSAGE - 1) downto 0); 
        P_POLYNOM : in std_logic_vector( (G_POLYNOM - 1) downto 0)
    );
end crc_checker;


architecture BEHAVIOR of crc_checker is 

    signal s_enable : std_logic := '0';
    signal s_counter : unsigned(3 downto 0) := (others => '0');
    signal s_shift_ploynom : std_logic_vector( (G_MESSAGE - 1) downto 0) := (others => '0'); 
    signal s_shift_signal : std_logic := '0';

    begin 

        process (P_CLOCK_50, P_RESET) 
        begin
            if (s_enable = '0') then 

                -- init state
                s_enable <= '1';
                s_counter <= (others => '0');
                s_shift_ploynom(31 downto 24) <= P_POLYNOM;  
                report "in init!";

                for i in 31 downto 0 loop
                    report std_logic'image(s_shift_ploynom(i)); 
                end loop;

            else 

                -- exec state
                if (rising_edge(P_CLOCK_50)) then 

                    s_counter <= s_counter + 1;
                    s_shift_ploynom <= shift_right(s_shift_ploynom, 1);
                    for i in 31 downto 0 loop
                        report std_logic'image(s_shift_ploynom(i)); 
                    end loop;

                    if (s_counter = 5) then 
                        s_enable <= '0';
                    end if;

                end if;

            end if;

        end process;

end BEHAVIOR;