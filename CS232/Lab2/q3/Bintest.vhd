library IEEE;
use IEEE.std_logic_1164.all;

entity Bintest is
end entity;

architecture tb of Bintest is
    signal BinaryValue : STD_LOGIC_VECTOR(7 downto 0) := "00101011";
    signal DecimalResult : INTEGER;

    component BinaryToDecimal is
        port (
        BinaryInput : in STD_LOGIC_VECTOR(7 downto 0);
        DecimalOutput : out INTEGER
    );
    end component;
begin
        dut_instance: BinaryToDecimal
        port map(
            BinaryInput => BinaryValue,
            DecimalOutput => DecimalResult
        );
        process
        begin
            wait for 1 ns;
            assert (to_string(DecimalResult) = "43")
                report to_string(DecimalResult)
                severity error;
            
        end process;
end architecture;