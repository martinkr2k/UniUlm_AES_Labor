library ieee;
use ieee.std_logic_1164.all;

entity rs_latch is 
  port (
    p_clk : in std_logic;
    p_r : in std_logic;
    p_s : in std_logic;
    p_q : out std_logic
  );
end rs_latch;


architecture STRUCTURAL of rs_latch is 
  signal s_rg, s_sg : std_logic;
  signal s_qa, s_qb : std_logic;  
  ATTRIBUTE KEEP : BOOLEAN;
  ATTRIBUTE KEEP OF s_rg, s_sg, s_qa, s_qb : SIGNAL IS TRUE;

  begin 

    s_rg <= p_r AND p_clk;
    s_sg <= p_s AND p_clk;
    
    --s_rg <= p_r;
    --s_sg <= p_s;

    s_qa <= not(s_rg OR s_qb);
    s_qb <= not(s_sg OR s_qa);
    
    p_q <= s_qa;

end STRUCTURAL;


architecture STRUCTURAL_NAND of rs_latch is 
  signal s_rg, s_sg : std_logic;
  signal s_qa, s_qb : std_logic;
  ATTRIBUTE KEEP : BOOLEAN;
  ATTRIBUTE KEEP of s_rg, s_sg, s_qa, s_qb : SIGNAL IS TRUE;

  begin 

    s_rg <= not(p_r AND p_clk);
    s_sg <= not(p_s AND p_clk);

    s_qa <= not(s_qb AND s_sg);
    s_qb <= not(s_qa AND s_rg);
    
    p_q <= s_qa;

end STRUCTURAL_NAND;
