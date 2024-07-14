library IEEE;
use IEEE.std_logic_1164.all;

entity test_mux is
end entity;

architecture tb of test_mux is
    signal D_test : std_logic_vector (3 downto 0);
    signal S_test : std_logic_vector (1 downto 0);
    signal out_test : std_logic;

    component AND_Gate is
        port(x1: in std_logic; x2: in std_logic; y: out std_logic);
    end component;

    component OR_Gate is
        port(x1: in std_logic; x2: in std_logic;  y: out std_logic);
    end component;

    component NOT_Gate is
        port(x: in std_logic; y: out std_logic);
    end component;

    component mux4x1 is
        port(D: in std_logic_vector (3 downto 0);
        S: in std_logic_vector(1 downto 0);
        Y: out std_logic);
    end component;

begin
    dut_instance: mux4x1
    port map(D => D_test, S => S_test, Y => out_test);

    process
    begin
        S_test <= "00";
        D_test <= "1111";

        wait for 1 ns;

        S_test <= "01";
        D_test <= "1111";

        wait for 1 ns;

        S_test <= "10";
        D_test <= "1111";

        wait for 1 ns;

        S_test <= "11";
        D_test <= "0000";

        wait for 1 ns;
    end process;
end architecture;