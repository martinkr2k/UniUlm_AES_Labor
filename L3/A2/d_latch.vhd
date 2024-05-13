library ieee;
use ieee.std_logic_1164.all;

entity d_latch is 
  port (
    sw : in std_logic_vector(9 downto 0);
    ledr : out std_logic_vector(9 downto 0)
  );
end d_latch;


architecture STRUCTURAL_NAND of d_latch is 
  signal s_r, s_s : std_logic;
  begin 
    
    RSL : entity work.rs_latch(STRUCTURAL_NAND) port map (sw(1), s_r, s_s, ledr(0));

    s_r <= not(sw(0));
    s_s <= sw(0);

end STRUCTURAL_NAND;