library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
  port (
    clock_50 : in std_logic;
    hex0 : out std_logic_vector(6 downto 0)
  );
end counter;

architecture behavior of counter is 

--  component htb -- hex to bin
--    port (
--      input : in std_logic_vector(3 downto 0)
--      output : out std_logic_vector(6 downto 0)
--    );
--  end component;

  signal clk : std_logic;
  signal count : std_logic_vector(24 downto 0);
  signal number : std_logic_vector(3 downto 0);
  signal output : std_logic_vector(6 downto 0);
  begin 

--  Digit0 : htp port map (number, output);
  HEX0 : entity work.segment_dec(DATAFLOW) port map(number, output);

  process (clk)
  begin 

    if (rising_edge(clock_50)) then 
    
    end if;
  end process;

  process (clk)
  begin 
    if (rising_edge(clk)) then

      if (number = "1010") then
	number <= "0000";
      else 
	-- increase
	number <= "1000";
      end if;
    end if;

  end process;

end behavior;


