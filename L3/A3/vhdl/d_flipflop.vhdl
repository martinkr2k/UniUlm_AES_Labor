library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop is 
  port (
    sw : in std_logic_vector(9 downto 0);
    ledr : out std_logic_vector(9 downto 0)
  );
end d_flipflop;


architecture DATAFLOW of d_flipflop is 
  signal s_qrsl1 : std_logic;
  signal s_nclk : std_logic;
  begin

    RSL1 : entity work.d_latch(STRUCTURAL_NAND) port map(sw(1), sw(0), s_qrsl1);
    RSL2 : entity work.d_latch(STRUCTURAL_NAND) port map(s_nclk, s_qrsl1, ledr(0));

    s_nclk <= not(sw(1));

end DATAFLOW;
