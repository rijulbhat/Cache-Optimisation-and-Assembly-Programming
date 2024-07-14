library IEEE;
use IEEE.std_logic_1164.all;

entity mux4x1 is
    port(D: in std_logic_vector (3 downto 0);
    S: in std_logic_vector(1 downto 0);
    Y: out std_logic);
end entity; 

architecture behaviour of mux4x1 is
    signal not_s0, not_s1 : std_logic;
    signal s00, s01, s10, s11 : std_logic;
    signal a, b, c, dd : std_logic;
    signal alpha, beta : std_logic;

    component AND_Gate is
        port(x1: in std_logic; x2: in std_logic; y: out std_logic);
    end component;
    
    component OR_Gate is
        port(x1: in std_logic; x2: in std_logic;  y: out std_logic);
    end component;
    
    component NOT_Gate is
        port(x: in std_logic; y: out std_logic);
    end component;
begin
    not_S0000: NOT_Gate
    port map(x => S(0), y => not_s0);
    not_S1111: NOT_Gate
    port map(x => S(1), y => not_s1);
    
    and_1: AND_Gate
    port map(x1 => S(0), x2 => S(1), y => s00);
    and_2: AND_Gate
    port map(x1 => S(0), x2 => not_s1, y => s01);
    and_3: AND_Gate
    port map(x1 => not_s0, x2 => S(1), y => s10);
    and_4: AND_Gate
    port map(x1 => not_s0, x2 => not_s1, y => s11);

    and_5: AND_Gate
    port map(x1 => s00, x2 => D(0), y => a);
    and_6: AND_Gate
    port map(x1 => s01, x2 => D(1), y => b);
    and_7: AND_Gate
    port map(x1 => s10, x2 => D(2), y => c);
    and_8: AND_Gate
    port map(x1 => s11, x2 => D(3), y => dd);

    or_1: OR_Gate
    port map(x1 => a, x2 => b, y => alpha);
    or_2: OR_Gate
    port map(x1 => c, x2 => dd, y => beta);

    or_3: OR_Gate
    port map(x1 => alpha, x2 => beta, y => Y);
end architecture;