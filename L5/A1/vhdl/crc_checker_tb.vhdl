library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity crc_checker_tb is
end crc_checker_tb;


architecture TB of crc_checker_tb is 
   
    constant C_POLY_LEN : positive := C_POLYNOM;
    constant C_MESS_LEN : positive := C_MESSAGE;
    signal s_polynom : std_logic_vector( (C_POLY_LEN - 1) downto 0) := (others => '0');
    signal s_message : std_logic_vector( (C_MESS_LEN - 1) downto 0) := (others => '0');

    begin 

        CRC : entity work.crc_checker(BEHAVIOR) generic map (C_POLY_LEN, C_MESS_LEN) port map (s_polynom, s_message);
        
        process 
        begin 
            
            s_polynom <= "00000001";
            s_message <= "00000000000000000000000000000000";
            wait for 2 ns;

            




            report "end of test!";
            wait;
        end process;

end TB;

