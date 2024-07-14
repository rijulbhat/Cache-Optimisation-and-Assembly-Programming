library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BinaryToDecimal is
    port (
        BinaryInput : in STD_LOGIC_VECTOR(7 downto 0);  -- Input port for the binary value
        DecimalOutput : out INTEGER  -- Output port for the decimal representation
    );
end BinaryToDecimal;

architecture Behavioral of BinaryToDecimal is
begin
    process
        variable TempDecimal : INTEGER := 0;
    begin
        TempDecimal := 0;
        for i in 0 to 7 loop
            if BinaryInput(i) = '1' then
                TempDecimal := TempDecimal + 2**i;
            end if;
        end loop;
        wait for 0.0001 ns;
        DecimalOutput <= TempDecimal;
    end process;
end Behavioral;
-- IT REMEMBERS VALUE OF TempDecimal