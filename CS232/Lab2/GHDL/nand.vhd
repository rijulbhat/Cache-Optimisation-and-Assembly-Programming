library IEEE;
use IEEE.std_logic_1164.all;

entity NAND_Gate is
    port(x1: in std_logic;
    x2: in std_logic;
    y: out std_logic);
end entity;

architecture behaviour of NAND_Gate is
    signal tmp: std_logic;
begin
    tmp <= x1 or x2;
    y <= not tmp;
end architecture;
