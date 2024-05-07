LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY light IS
	PORT(
		x1, x2 : IN std_logic;
		f: OUT std_logic
	);
END light;

ARCHITECTURE LogicFunction OF light IS
	BEGIN
	
	f <= (x1 AND NOT x2) OR (NOT x1 AND x2);

END LogicFunction;