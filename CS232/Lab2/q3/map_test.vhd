library ieee;
use ieee.std_logic_1164.all;

entity map_test is 
end entity;

architecture tb of map_test is
    signal output : std_logic_vector(3 downto 0);
    component mapping is
        port(
        ebit_input: in std_logic_vector(7 downto 0);
        fbit_output: out std_logic_vector(3 downto 0)  
        );
    end component;
    begin
        dut_instance: mapping
        port map(
            ebit_input => "01100001",
            fbit_output => output
        );
    process
    begin
        wait for 1 ns;
        assert (output = "0000")
        report to_string(output) & "NOOOOOO"
        severity error;
        
    end process;
end architecture;