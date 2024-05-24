library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity crc_checker_tb is
end crc_checker_tb;


architecture TB of crc_checker_tb is 
   
    constant c_message : positive := 32;
    constant c_polynom : positive := 8;

    signal s_clk : std_logic := '0';
    signal s_reset : std_logic := '0';
    signal s_enable : std_logic := '0';
    signal s_message : std_logic_vector( (c_message - 1) downto 0) := (others => '0');
    signal s_polynom : std_logic_vector( (c_polynom - 1) downto 0) := (others => '0');

    begin
        
        CRC : entity work.crc_checker(BEHAVIOR) port map (s_clk, s_reset, s_message, s_polynom);

        process 
        begin 

            report "begin of test!";

            s_polynom <= "11111111";

            for i in 0 to 9 loop
                
                s_clk <= '0';
                wait for 2 ns;
                s_clk <= '1';
                wait for 2 ns;
                report "------- CLOCK CYCLE";

            end loop;

            report "end of test!";
            wait;
        end process;


end TB;