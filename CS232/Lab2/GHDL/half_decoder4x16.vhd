library IEEE;
use IEEE.std_logic_1164.all;

entity half_decoder4x16 is
    port(
    in1: in std_logic;
    in2: in std_logic;
    en1: in std_logic;
    en2: in std_logic;
    O_group : out std_logic_vector (7 downto 0)
    );
end entity;

architecture behaviour of half_decoder4x16 is
    signal o1, o2 : std_logic_vector (3 downto 0);

    component decoder2x4 is
        port (
        x1: in std_logic;
        x2: in std_logic;
        en : in std_logic;
        O: out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;
begin
    decode_1: decoder2x4
    port map(x1 => in1, x2 => in2, en => en1, O => o1);

    decode_2: decoder2x4
    port map(x1 => in1, x2 => in2, en => en2, O => o2);

    O_group <= o2 & o1;
end architecture;