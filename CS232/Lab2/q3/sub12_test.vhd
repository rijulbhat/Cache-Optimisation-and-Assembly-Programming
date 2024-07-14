library ieee;
use ieee.std_logic_1164.all;

entity sub12_test is
end entity;

architecture tb of sub12_test is
    signal input1, input2, output1 : std_logic_vector(3 downto 0); 
    component sub_mod_123 is 
        port(
            in3, in4 : in STD_LOGIC_VECTOR(3 downto 0);
            out2 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    begin
        dut_instance: sub_mod_123
        port map(
            in3 => input1,
            in4 => input2,
            out2 => output1
        );
    process
        begin
            
            input1 <= "0101";
            input2 <= "0111";
            wait for 1 ns;

            input1 <= "0111";
            input2 <= "0101";
            wait for 1 ns;
    end process;
end architecture;