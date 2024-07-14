library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder2x4 is
    port (
        x1: in std_logic;
        x2: in std_logic;
        en : in std_logic;
        O: out STD_LOGIC_VECTOR (3 downto 0)
    );
end decoder2x4;

architecture behavioral of decoder2x4 is
    signal not_x1 : std_logic;
    signal not_x2 : std_logic;
    signal O_on : std_logic_vector(3 downto 0);

    component AND_Gate is
        port(x1: in std_logic; x2: in std_logic;  y: out std_logic);
    end component;

    component NOT_Gate is
        port(x: in std_logic; y: out std_logic);
    end component;

begin
    dut_instance_not1: NOT_Gate
    port map(x => x2, y => not_x2);

    dut_instance_not2: NOT_Gate
    port map(x => x1, y => not_x1);

    dut_instance_and1: AND_Gate
    port map(x1 => x1, x2 => x2, y => O_on(3));

    dut_instance_and2: AND_Gate
    port map(x1 => x1, x2 => not_x2, y => O_on(2));

    dut_instance_and3: AND_Gate
    port map(x1 => not_x1, x2 => x2, y => O_on(1));

    dut_instance_and4: AND_Gate
    port map(x1 => not_x1, x2 => not_x2, y => O_on(0));

    dut_instance_and5: AND_Gate
    port map(x1 => O_on(3), x2 => en, y => O(3));

    dut_instance_and6: AND_Gate
    port map(x1 => O_on(2), x2 => en, y => O(2));

    dut_instance_and7: AND_Gate
    port map(x1 => O_on(1), x2 => en, y => O(1));

    dut_instance_and8: AND_Gate
    port map(x1 => O_on(0), x2 => en, y => O(0));

end architecture;