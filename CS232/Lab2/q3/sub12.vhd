library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity onebitadder is
    port (
        input1, input2, carry_old : in std_logic;
        carry_new, sum_new : out std_logic
    );
end onebitadder;

architecture behaviour1 of onebitadder is
begin
    sum_new <= (input1 xor input2) xor carry_old;
    carry_new <= (input1 and input2) or (input1 and carry_old) or (input2 and carry_old);
end behaviour1;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port (
        in1, in2 : in STD_LOGIC_VECTOR(3 downto 0);
        out1 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end FullAdder;

architecture behaviour2 of FullAdder is
    signal sum : STD_LOGIC_VECTOR(3 downto 0);
    signal carry : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    component onebitadder is 
        port(
            input1, input2, carry_old: in std_logic;
            carry_new, sum_new: out std_logic
        );
    end component;

begin
    instance_1 : onebitadder
    port map(
        input1 => in1(0),
        input2 => in2(0),
        carry_old => carry(0),
        carry_new => carry(1),
        sum_new => sum(0)
    );
    instance_2 : onebitadder
    port map(
        input1 => in1(1),
        input2 => in2(1),
        carry_old => carry(1),
        carry_new => carry(2),
        sum_new => sum(1)
    );
    instance_3 : onebitadder
    port map(
        input1 => in1(2),
        input2 => in2(2),
        carry_old => carry(2),
        carry_new => carry(3),
        sum_new => sum(2)
    );
    instance_4 : onebitadder
    port map(
        input1 => in1(3),
        input2 => in2(3),
        carry_old => carry(3),
        carry_new => carry(4),
        sum_new => sum(3)
    );
    out1 <= sum;
end behaviour2;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_mod_12 is 
    port(
        in1, in2 : in std_logic_vector(3 downto 0);
        out1 : out std_logic_vector(3 downto 0)
    );
end add_mod_12;

architecture behaviour of add_mod_12 is
    signal out2, out3 : std_logic_vector(3 downto 0);
    component FullAdder is 
        port (
            in1, in2 : in STD_LOGIC_VECTOR(3 downto 0);
            out1 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
begin
    dut_instance: FullAdder
    port map(in1, in2, out2); 
    dut_instance_2: FullAdder
    port map(out2, "0100", out3);
    process(out2, out3)
    begin
        if (out2 >= "1100") then
            out1 <= out3;
        else
            out1 <= out2;
        end if;
    end process;
end behaviour;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub_mod_12 is
    port (
        in3, in4 : in std_logic_vector (3 downto 0);
        out2 : out std_logic_vector (3 downto 0)
    );
end sub_mod_12;

architecture behaviour3 of sub_mod_12 is
    signal in5, in6, in7, in8, in9, out3, out4, new_var: std_logic_vector (3 downto 0);
    
    component FullAdder is 
        Port (
            in1, in2 : in STD_LOGIC_VECTOR(3 downto 0);
            out1 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
begin
    dut_instance1: FullAdder
    port map(
        in1 => in5,
        in2 => "0001",
        out1 => in6
    );

    dut_instance2: FullAdder
    port map(
        in1 => in3,
        in2 => in6,
        out1 => out3
    );
    dut_instance3: FullAdder
    port map(
        in1 => in7,
        in2 => "0001",
        out1 => in8
    );
    dut_instance4: FullAdder
    port map(
        in1 => in8,
        in2 => in3,
        out1 => in9
    );
    dut_instance5: FullAdder
    port map(
        in1 => in9,
        in2 => "1100",
        out1 => out4
    );

    in5 <= not in4;
    in7 <= not in4;
    
    process(out3, out4)
    begin
        if (in3 >= in4) then
            out2 <= out3;
        else
            out2 <= out4;
        end if;
    end process;

end behaviour3; 