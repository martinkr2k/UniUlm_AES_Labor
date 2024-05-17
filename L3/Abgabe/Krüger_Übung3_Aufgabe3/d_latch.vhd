library ieee;
use ieee.std_logic_1164.all;

entity d_latch is 
  port (
    p_clk : in std_logic;
    p_d : in std_logic;
    p_q : out std_logic
  );
end d_latch;


architecture STRUCTURAL_NAND of d_latch is 
  signal s_r, s_s : std_logic;
  begin 
    
    RSL : entity work.rs_latch(STRUCTURAL_NAND) port map (p_clk, s_r, s_s, p_q);

    s_r <= not(p_d);
    s_s <= p_d;

end STRUCTURAL_NAND;