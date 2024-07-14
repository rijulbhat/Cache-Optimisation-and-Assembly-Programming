library IEEE;
use IEEE.std_logic_1164.all;

entity decoder4x16 is
    port(a, b, c, d, enable: in std_logic;
    dec: out std_logic_vector(15 downto 0));
end entity;

architecture behaviour of decoder4x16 is
    signal O_first : std_logic_vector (3 downto 0);
    signal O_second, O_third : std_logic_vector (7 downto 0);

    component decoder2x4 is
    port (
        x1 : in std_logic;
        x2 : in std_logic;
        en : in std_logic;
        O: out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;
    
    component half_decoder4x16 is
    port(
        in1: in std_logic;
        in2: in std_logic;
        en1: in std_logic;
        en2: in std_logic;
        O_group : out std_logic_vector (7 downto 0)
    );
    end component;
    
begin
    instance_1: decoder2x4
    port map(x1 => a, x2 => b, en => enable, O => O_first);

    instance_2: half_decoder4x16
    port map(in1 => c, in2 => d, en1 => O_first(0), en2 => O_first(1), O_group => O_second);

    instance_3: half_decoder4x16
    port map(in1 => c, in2 => d, en1 => O_first(2), en2 => O_first(3), O_group => O_third);

    dec <= O_third & O_second;

end architecture;