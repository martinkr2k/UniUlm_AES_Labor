library ieee;
use ieee.std_logic_1164.all;

entity fourbit_fa is 
  port (
    p_a : in std_logic_vector(3 downto 0);
    p_b : in std_logic_vector(3 downto 0);
    p_cin : in std_logic;
    p_sum : out std_logic_vector(3 downto 0);
    p_cout : out std_logic
  );
end fourbit_fa;


architecture DATAFLOW of fourbit_fa is 
  signal s_ctemp : std_logic_vector(4 downto 0);
  begin 

    FA0 : entity work.fa(DATAFLOW) port map(p_a(0), p_b(0), s_ctemp(0), p_sum(0), s_ctemp(1));
    FA1 : entity work.fa(DATAFLOW) port map(p_a(1), p_b(1), s_ctemp(1), p_sum(1), s_ctemp(2));
    FA2 : entity work.fa(DATAFLOW) port map(p_a(2), p_b(2), s_ctemp(2), p_sum(2), s_ctemp(3));
    FA3 : entity work.fa(DATAFLOW) port map(p_a(3), p_b(3), s_ctemp(3), p_sum(3), s_ctemp(4));

    s_ctemp(0) <= p_cin;
    p_cout <= s_ctemp(4);

end DATAFLOW;
