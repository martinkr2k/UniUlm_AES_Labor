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
        CLOCK_50 : in std_logic;
        --P_MESSAGE : in std_logic_vector( (G_MESSAGE - 1) downto 0); 
        --P_POLYNOM : in std_logic_vector( (G_POLYNOM - 1) downto 0);
        P_MESSAGE : in std_logic_vector(31 downto 0); 
        P_POLYNOM : in std_logic_vector(7 downto 0);
        P_OUTPUT : out std_logic_vector( (G_MESSAGE - 1) downto 0)
    );
end crc_checker;


architecture BEHAVIOR of crc_checker is
    
    -- claculate length of counter vector
    function log2ceil(arg : positive) return natural is
        variable tmp : positive     := 1;
        variable log : natural      := 0;
        begin
        
        if arg = 1 then 
            return 0;
        end if;
        
        while arg > tmp loop
            tmp := tmp * 2;
            log := log + 1;
        end loop;
       
        return log;
    end function;
    
    -- signals
    constant c_counter_bits : positive := log2ceil(G_MESSAGE);
    signal s_counter : unsigned(c_counter_bits downto 0) := (others => '0');
    constant c_messageMin1 : positive := (G_MESSAGE - 1);

    signal s_polynom : std_logic_vector( (G_MESSAGE - 1) downto 0) := (others => '0');
    signal s_enable : std_logic;

    begin

        process (P_MESSAGE, P_POLYNOM) 
        begin 

            s_enable <= '1';
            s_polynom(31 downto 24) <= P_POLYNOM;
            P_OUTPUT <= s_polynom;
            report "in p1";
        
        end process;


        process (CLOCK_50)
        begin 

            report "in p2";
            if (s_enable = '1') then 
                report "in p2 if"; 
                if (rising_edge(CLOCK_50)) then
                    
                    for i in 31 downto 0 loop
                        report std_logic'image(s_polynom(i));
                    end loop;
                    
                    s_enable <= '0';
                end if;
            end if;

            report "ends p2";

        end process;
        
--        process (CLOCK_50)
--        begin
--            
--            if (rising_edge(CLOCK_50)) then
--                
--                if (s_enable = '1') then 
--
--                end if;
--            end if;
--
--
--        end process;

end BEHAVIOR;