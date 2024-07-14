library IEEE;
use IEEE.std_logic_1164.all;

entity mapping is
    port(
        ebit_input: in std_logic_vector(7 downto 0);
        fbit_output: out std_logic_vector(3 downto 0)
    );
end entity;

architecture behaviour of mapping is
begin
    process(ebit_input)
    begin
    if (ebit_input = "01100001") then
        fbit_output <= "1000"; -- a
    elsif(ebit_input = "01000001") then
        fbit_output <= "1001"; -- A
    elsif(ebit_input = "01100010") then
        fbit_output <= "1010"; -- b
    elsif(ebit_input = "01000010") then
        fbit_output <= "1011"; -- B
    elsif(ebit_input = "01100011") then
        fbit_output <= "1011"; -- c
    elsif(ebit_input = "01000011") then
        fbit_output <= "0000"; -- C
    elsif(ebit_input = "01100100") then
        fbit_output <= "0001"; -- d
    elsif(ebit_input = "01000100") then
        fbit_output <= "0010"; -- D
    elsif(ebit_input = "01100101") then
        fbit_output <= "0011"; -- e
    elsif(ebit_input = "01000101") then
        fbit_output <= "0100"; -- E
    elsif(ebit_input = "0110110") then
        fbit_output <= "0100"; -- f
    elsif(ebit_input = "01000110") then
        fbit_output <= "0101"; -- F
    elsif(ebit_input = "01100111") then
        fbit_output <= "0110"; -- g
    elsif(ebit_input = "01000111") then
        fbit_output <= "0111"; -- G
    end if;
    end process;
end architecture;