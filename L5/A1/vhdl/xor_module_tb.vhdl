library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.constant_package.all;
use IEEE.numeric_std.all;

entity xor_module_tb is 
end xor_module_tb;


architecture TB of xor_module_tb is
    constant c_len : positive := 8;
    signal s_a, s_b, s_o : std_logic_vector( (c_len - 1) downto 0) := (others => '0'); 
    
    begin

        XORM: entity work.xor_module(DATAFLOW) generic map (c_len) port map (s_a, s_b, s_o);
        
        process 
        begin

            s_a <= "00000000";
            s_b <= "00000000";
            wait for 2 ns;
            assert (s_o = "00000000") report "tc 1: error";

            s_a <= "00000001";
            s_b <= "00000001";
            wait for 2 ns;
            assert (s_o = "00000000") report "tc 2: error";

            s_a <= "01010101";
            s_b <= "10101010";
            wait for 2 ns;
            assert (s_o = "11111111") report "tc 3: error";

--            for i in 7 downto 0 loop
--                
--                report std_logic'image(s_o(i));
--
--            end loop;

            s_a <= "00110111";
            s_b <= "10010011";
            wait for 2 ns;
            assert (s_o = "10100100") report "tc 4: error";

            s_a <= "00111100";
            s_b <= "00001111";
            wait for 2 ns;
            assert (s_o = "00110011") report "tc 5: error";


            report "end of test";
            wait;
        end process;

end TB;