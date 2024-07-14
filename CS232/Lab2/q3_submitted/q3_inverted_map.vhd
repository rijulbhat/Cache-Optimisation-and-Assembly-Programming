library IEEE;
use IEEE.std_logic_1164.all;

entity inverted_mapping is
    port(
        fbit_input: in std_logic_vector(3 downto 0);
        ebit_output: out std_logic_vector(7 downto 0)
    );
end entity;

architecture behaviour of inverted_mapping is
begin
    process(fbit_input)
    begin
    if (fbit_input = "1000") then
        ebit_output <= "01100001"; -- a
    elsif(fbit_input = "1001") then
        ebit_output <= "01000001"; -- A
    elsif(fbit_input = "1010") then
        ebit_output <= "01100010"; -- b
    elsif(fbit_input = "1011") then
        ebit_output <= "01000010"; -- B
    elsif(fbit_input = "0000") then
        ebit_output <= "01000011"; -- C
    elsif(fbit_input = "0001") then
        ebit_output <= "01100100"; -- d
    elsif(fbit_input = "0010") then
        ebit_output <= "01000100"; -- D
    elsif(fbit_input = "01100101") then
        ebit_output <= "01100101"; -- e
    elsif(fbit_input = "0100") then
        ebit_output <= "01000101"; -- E
    elsif(fbit_input = "0101") then
        ebit_output <= "01000110"; -- F
    elsif(fbit_input = "01100111") then
        ebit_output <= "01100111"; -- g
    elsif(fbit_input = "0111") then
        ebit_output <= "01000111"; -- G
    end if;
    end process;
end architecture;