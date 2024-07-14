library IEEE;
use IEEE.std_logic_1164.all;

entity test_encoder is
end entity;

architecture tb of test_encoder is
    signal I_test : std_logic_vector(3 downto 0);
    signal Y_test : std_logic_vector(1 downto 0);

    component OR_Gate is
        port(x1: in std_logic; x2: in std_logic;  y: out std_logic);
    end component;

    component encoder4x2 is
        port(I: in std_logic_vector (3 downto 0);
        Y: out std_logic_vector(1 downto 0));
    end component;

begin
    dut_instance: encoder4x2
    port map(I => I_test, Y => Y_test);

    process
    begin
        I_test <= "0001";

        wait for 1 ns;

        I_test <= "0010";

        wait for 1 ns;

        I_test <= "0100";

        wait for 1 ns;

        I_test <= "1000";

        wait for 1 ns;
    end process;
    end architecture;