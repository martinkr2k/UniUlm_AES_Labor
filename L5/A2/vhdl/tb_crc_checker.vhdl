library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_crc_checker is
end tb_crc_checker;

architecture testbench of tb_crc_checker is

    -- Component declaration for the Unit Under Test (UUT)
    component crc_checker
    generic (
        G_POLYNOM : positive := 8;
        G_MESSAGE : positive := 32
    );
    port (
        CLOCK_50 : in std_logic;
        P_MESSAGE : in std_logic_vector(31 downto 0);
        P_POLYNOM : in std_logic_vector(7 downto 0);
        P_OUTPUT : out std_logic_vector((G_MESSAGE - 1) downto 0)
    );
    end component;

    -- Testbench signals
    signal CLOCK_50 : std_logic := '0';
    signal P_MESSAGE : std_logic_vector(31 downto 0) := (others => '0');
    signal P_POLYNOM : std_logic_vector(7 downto 0) := (others => '0');
    signal P_OUTPUT : std_logic_vector(31 downto 0);

    -- Clock period definition
    constant CLOCK_PERIOD : time := 20 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: crc_checker
    generic map (
        G_POLYNOM => 8,
        G_MESSAGE => 32
    )
    port map (
        CLOCK_50 => CLOCK_50,
        P_MESSAGE => P_MESSAGE,
        P_POLYNOM => P_POLYNOM,
        P_OUTPUT => P_OUTPUT
    );

    -- Clock generation process
    CLOCK_50_process :process
    begin
        while true loop
            CLOCK_50 <= '0';
            wait for CLOCK_PERIOD / 2;
            CLOCK_50 <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Initial values
        P_MESSAGE <= x"12345678";
        P_POLYNOM <= x"1D";
        
        -- Wait for a couple of clock cycles
        wait for 3 * CLOCK_PERIOD;

        -- Wait and observe the changes
        wait for 10 * CLOCK_PERIOD;

        -- End simulation
        assert false report "End of simulation" severity failure;
    end process;

end testbench;