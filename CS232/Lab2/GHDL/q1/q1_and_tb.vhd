library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end entity;

architecture tb of test is
    signal s1, s2 : std_logic;
    signal o1 : std_logic;

    component AND_Gate is
        port(x1: in std_logic; x2: in std_logic; y: out std_logic);
    end component;

begin
    dut_instance1: AND_Gate
    port map(x1 => s1, x2 => s2, y => o1);
    process
    begin
        s1 <= '0';
        s2 <= '0';

        wait for 1 ns;

        s1 <= '0';
        s2 <= '1';

        wait for 1 ns;

        s1 <= '1';
        s2 <= '0';

        wait for 1 ns;

        s1 <= '1';
        s2 <= '1';

        wait for 1 ns;
    end process;
end architecture;