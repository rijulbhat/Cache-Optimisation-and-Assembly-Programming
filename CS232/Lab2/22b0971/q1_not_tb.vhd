library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end entity;

architecture tb of test is
    signal s1 : std_logic;
    signal o3 : std_logic;

    component NOT_Gate is
        port(x: in std_logic; y: out std_logic);
    end component;

begin
    dut_instance3: NOT_Gate
    port map(x => s1, y => o3);
    process
    begin
        s1 <= '0';

        wait for 1 ns;

        s1 <= '1';

        wait for 1 ns;
    end process;
end architecture;