library IEEE;
use IEEE.std_logic_1164.all;

entity test_mux is
end entity;

architecture tb of test_mux is
    signal d : std_logic_vector (3 downto 0);
    signal s : std_logic_vector (1 downto 0);
    signal output : std_logic;

    component mux4x1 is
        port(D: in std_logic_vector (3 downto 0);
        S: in std_logic_vector(1 downto 0);
        Y: out std_logic);
    end component; 

begin

    dut_instance6: mux4x1
    port map(
        D => d,
        S => s,
        Y => output
    );

    d <= "0110";

    process
    begin
        s <= "00";

        wait for 1 ns;

        s <= "01";

        wait for 1 ns;

        s <= "10";
        
        wait for 1 ns;

        s <= "11";
        
        wait for 1 ns;
    end process;

end architecture;