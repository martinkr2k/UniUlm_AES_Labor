library ieee;
use ieee.std_logic_1164.all;

entity fa is 
  port (
    p_a : in std_logic;
    p_b : in std_logic;
    p_cin : in std_logic;
    p_sum : out std_logic;
    p_car : out std_logic
  );
end fa;


architecture DATAFLOW of fa is 
  signal s_ha1_sum, s_ha1_car, s_ha2_sum, s_ha2_car : std_logic;
  begin

    HA1 : entity work.ha(DATAFLOW) port map(p_a, p_b, s_ha1_sum, s_ha1_car);
    HA2 : entity work.ha(DATAFLOW) port map(s_ha1_sum, p_cin, s_ha2_sum, s_ha2_car);

    p_sum <= s_ha2_sum;
    p_car <= s_ha2_car OR s_ha1_car;

end DATAFLOW;
