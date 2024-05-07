library ieee;
use ieee.std_logic_1164.all;

entity rs_latch is 
	port (
		p_r, p_s : in std_logic;
		p_clk : in std_logic;
		p_q : out std_logic
	);
end rs_latch;


architecture STRUCTURAL of rs_latch is 
	signal s_r_g, s_r_g : std_logic;
	signal s_qa, s_qb : std_logic;
	attribute KEEP : BOOLEAN;
	attribute KEEP OF s_r_g, s_s_g, s_qa, s_qb : SIGNAL IS TRUE;
	
begin

	s_r_g <= p_r AND p_clk;
	s_s_g <= p_s AND p_clk;

	s_qa <= not(s_r_g OR s_qb);
	s_qb <= not(s_s_g OR s_qa);

	p_q <= s_qa;

end STRUCTURAL;
