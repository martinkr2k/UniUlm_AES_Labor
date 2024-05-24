library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity shift_module_tb is 
end shift_module_tb;


architecture TB of shift_module_tb is 
    constant c_len : positive := 8;
    signal s_shift : positive := 0;
    signal s_in, s_out : std_logic_vector( (c_len - 1) downto 0); 
    begin 

        process 
        begin 

            s_shift <= 0;
            s_in <= "11111111";
            wait for 2 ns;
            assert (s_out = "11111111") report "tc 1: error!";

            s_shift <= 1;
            s_in <= "11111111";
            wait for 2 ns;
            assert (s_out = "11111110") report "tc 2: error!";

            s_shift <= 2;
            s_in <= "11111111";
            wait for 2 ns;
            assert (s_out = "11111100") report "tc 3: error!";

            s_shift <= 3;
            s_in <= "11111111";
            wait for 2 ns;
            assert (s_out = "11111000") report "tc 4: error!";

            s_shift <= 4;
            s_in <= "11111111";
            wait for 2 ns;
            assert (s_out = "11110000") report "tc 5: error!";

            s_shift <= 5;
            s_in <= "11111111";
            wait for 2 ns;
            assert (s_out = "11100000") report "tc 6: error!";

            s_shift <= 6;
            s_in <= "11111111";
            wait for 2 ns;
            assert (s_out = "11111000") report "tc 7: error!";

            s_shift <= 7;
            s_in <= "11111111";
            wait for 2 ns;
            assert (s_out = "10000000") report "tc 8: error!";

            s_shift <= 8;
            s_in <= "11111111";
            wait for 2 ns;
            assert (s_out = "00000000") report "tc 9: error!";



            report "end of test!";
            wait;
        end process;

end TB;

