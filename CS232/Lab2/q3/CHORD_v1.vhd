library ieee;
use IEEE.std_logic_1164.all;

entity CHORD_Encoder is
    port(clk, rst: in std_logic;
    a: in std_logic_vector(7 downto 0);
    data_valid: out std_logic;
    z: out std_logic_vector(7 downto 0));
end entity;

architecture behaviour of CHORD_encoder is
    signal n : std_logic_vector (3 downto 0) := "0000";
    signal sigA1 : std_logic_vector (7 downto 0);
    signal sig1, signal_a, signal_b, signal_c, signal_d, diff_a, diff_b, diff_c, diff_d: std_logic_vector (3 downto 0);
    signal add_sig1_a, add_sig1_b, add_sig1_c, add_sig1_d: std_logic_vector(3 downto 0);
    signal long_add_sig1_a, long_add_sig1_b, long_add_sig1_c, long_add_sig1_d : std_logic_vector(7 downto 0);
    signal long_signal_a, long_signal_b, long_signal_c, long_signal_d : std_logic_vector (7 downto 0);
    

    component mapping is
        port(
            ebit_input: in std_logic_vector(7 downto 0);
            fbit_output: out std_logic_vector(3 downto 0)
        );
    end component;

    component sub12 is 
        port (
            in3, in4 : in std_logic_vector (3 downto 0);
            out2 : out std_logic_vector (3 downto 0)
        );
    end component;

    component FullAdder is
        port (
            in1, in2 : in std_logic_vector (3 downto 0);
            out1 : out std_logic_vector (3 downto 0)
        );
    end component;

    component inverted_mapping is 
        port (
            fbit_input: in std_logic_vector(3 downto 0);
            ebit_output: out std_logic_vector(7 downto 0)
        );
    end component;

begin
    mapped: mapping
        port map(
            ebit_input => sigA1,
            fbit_output => sig1
        );
    
    difference_a: sub12
        port map(
            in3 => sig1,
            in4 => signal_a,
            out2 => diff_a
        );
    
    difference_b: sub12
        port map(
            in3 => sig1,
            in4 => signal_b,
            out2 => diff_b
        );

    difference_c: sub12
        port map(
            in3 => sig1,
            in4 => signal_c,
            out2 => diff_c
        );
    
    difference_d: sub12
        port map(
            in3 => sig1,
            in4 => signal_d,
            out2 => diff_d
        );
    add_one_a: FullAdder
        port map(
            in1 => signal_a,
            in2 => "0001",
            out1 => add_sig1_a
        );
    
    add_one_b: FullAdder
        port map(
            in1 => signal_b,
            in2 => "0001",
            out1 => add_sig1_b
        );

    add_one_c: FullAdder
        port map(
            in1 => signal_c,
            in2 => "0001",
            out1 => add_sig1_c
        );
    
    add_one_d: FullAdder
        port map(
            in1 => signal_d,
            in2 => "0001",
            out1 => add_sig1_d
        );

    invert_mapped_a: inverted_mapping
        port map(
            fbit_input => add_sig1_a,
            ebit_output => long_add_sig1_a
        );
    
    invert_mapped_b: inverted_mapping
        port map(
            fbit_input => add_sig1_b,
            ebit_output => long_add_sig1_b
        );
    
    invert_mapped_c: inverted_mapping
        port map(
            fbit_input => add_sig1_c,
            ebit_output => long_add_sig1_c
        );
    
    invert_mapped: inverted_mapping
        port map(
            fbit_input => add_sig1_d,
            ebit_output => long_add_sig1_d
        );
    
    process (clk, a, output_buffer, sig1, add_sig1_a, long_add_sig1_a, add_sig1_b, long_add_sig1_b, add_sig1_c, long_add_sig1_c, add_sig1_d, long_add_sig1_d, diff_a, diff_b) -- Add variables, rising edge
        variable output, sigA1 : std_logic_vector (7 downto 0) := "00000000";
        variable output_buffer : std_logic_vector (7 downto 0) := "00000000";
        variable output_buffer_next : std_logic_vector (7 downto 0) := "00000000";
    begin
        
        if rising_edge(clk) then

            -- report "ouch " & to_string(output);
            data_valid <= '0';
            output := "00000000";
            -- report "ouch2 " & to_string(output);
            if (output_buffer /= "00000000") then
                -- report to_string(output_buffer);
                data_valid <= '1';
                output := output_buffer;
                -- report "ufff " & to_string(output);
                output_buffer := output_buffer_next;
                output_buffer_next := "00000000";
                
            end if;

            sigA1 := a;
            report to_string(sigA1);
            
            if (n = "0000") then -- null
                signal_a <= sig1;
                long_signal_a <= sigA1;
                n <= "0001"; -- C E F #

            elsif (n="0001") then -- 0
                
                if (sigA1 = "00100011") then
                    signal_a <= add_sig1_a;
                    long_signal_a <= long_add_sig1_a;
                    n <= "0001";

                elsif (diff_a = "0010") then -- maybe minor
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "1111";
                
                elsif (diff_a = "0011") then -- maybe minor maybe major
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0010";
        
                elsif (diff_a = "0100") then -- maybe major maybe s
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0011";

                elsif (diff_a = "0101") then -- maybe s
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0100";
        
                else
                    data_valid <= '1';
                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;
                    signal_a <= sig1;
                    long_signal_a <= sigA1;
                    n <= "0001";

                end if;

            elsif (n = "1111") then -- 0 2
                if (sigA1 = "00100011") then
                    signal_b <= add_sig1_b;
                    long_signal_b <= long_add_sig1_b;
                    n <= "0010";
                elsif (diff_b = "0010") then
                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "1111";
                elsif (diff_b = "0011") then
                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0010";
                elsif (diff_b = "0100") then
                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0011";
                elsif (diff_b = "0101") then
                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0100";
                else
                    data_valid <= '1';
                    
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;
                    
                    signal_a <= sig1;
                    long_signal_a <= sigA1;
                    n <= "0001";    
                end if;
                
            elsif (n="0010") then -- 0 3
                    
                if (sigA1 = "00100011") then -- if next is # then go to maybe major chord c c+4
                    signal_b <= add_sig1_b;
                    long_signal_b <= long_add_sig1_b;
                    n <= "0011";

                elsif (diff_b = "0100") then -- it is a minor chord check for #
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1010";
                
                elsif (diff_b = "0010") then -- not a minor chord throw first c c+3 c+2
                    
                    data_valid <= '1';

                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;

                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "1111";
                
                elsif (diff_b = "0011") then -- maybe minor chord c c+3 c+6
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1110"; -- check for #

                elsif (diff_b = "0101") then -- c c+3 c+8 throw first
                    data_valid <= '1';
                    
                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;

                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0100";
                
                else -- c c+3 c+4(say) throw first two
                    data_valid <= '1';
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;
                    signal_a <= sig1;
                    long_signal_a <= sigA1;
                    n <= "0001";

                end if;

            elsif (n="1110") then -- 0 3 6

                if (sigA1 = "00100011") then -- 0 3 7 formed 
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1010"; -- check for #

                elsif (diff_c = "0100") then -- c c+3 c+6 c+10 throw 1 then go to 0 3 7
                    
                    data_valid <= '1';

                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;

                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= signal_c;
                    long_signal_b <= long_signal_c;
                    signal_c <= sig1;
                    long_signal_c <= sigA1;

                    n <= "1010";

                elsif (diff_c = "0010") then -- c c+3 c+6 c+8 so throw out first two

                    data_valid <= '1';

                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    signal_b <= sig1;
                    long_signal_a <= long_signal_c;
                    long_signal_b <= sigA1;

                    n <= "1111";

                elsif (diff_c = "0011") then -- c c+3 c+6 c+9
                    data_valid <= '1';
                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;
                    
                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= signal_c;
                    long_signal_b <= long_signal_c;
                    signal_c <= sig1;
                    long_signal_c <= sigA1;

                    n <= "1110";
                
                elsif (diff_c = "0101") then -- c c+3 c+6 c+11 throw first two

                    data_valid <= '1';
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    signal_b <= sig1;
                    long_signal_a <= long_signal_c;
                    long_signal_b <= sigA1;

                    n <= "0100";

                end if;
                
            elsif (n = "0011") then-- 0 4

                if (sigA1 = "00100011") then -- c c+5 formed go to 0100
                    signal_b <= add_sig1_b;
                    long_signal_b <= long_add_sig1_b;
                    n <= "0100";
                
                elsif (diff_b = "0010") then -- c c+4 c+6 check for major
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1101"; -- CREATE STATES created
                elsif (diff_b = "0010") then -- c c+4 c+7 check for major or 7 
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1100"; -- CREATE STATES
                elsif (diff_b = "0010") then -- c c+4 c+8 throw first
                    data_valid <= '1';
                    
                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;
                    
                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "0011";
                elsif (diff_b = "0010") then -- c c+4 c+9 throw first 
                    data_valid <= '1';

                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;
                    
                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "0100";
                else -- else throw first two
                    data_valid <= '1';
                    
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= sig1;
                    long_signal_a <= sigA1;

                    n <= "0001";
                end if;
            
            elsif(n = "0100") then -- 0 5
                if (sigA1 = "00100011") then -- 0 6 throw first
                    data_valid <= '1';

                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;

                    signal_a <= sig1;
                    long_signal_a <= sigA1;
                    n <= "0001";
                
                elsif(diff_b = "0010") then -- 0 5 7 check for # 
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1001"; -- CREATE STATE

                elsif(diff_b = "0001") then -- 0 5 6 wait for next input
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1011"; -- CREATE STATE

                elsif(diff_b = "0011") then -- 0 5 8 throw 1
                    
                    data_valid <= '1';
                        
                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;

                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;

                    signal_b <= sig1;
                    long_signal_b <= sigA1; 
                    
                    n <= "0010";

                elsif(diff_b = "0100") then -- 0 5 9 throw 1
                    
                    data_valid <= '1';

                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;

                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;                

                    n <= "0011";
                
                else -- 0 5 11 throw 2 

                    data_valid <= '1';

                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= sig1;
                    long_signal_a <= sigA1;

                    n <= "0001";
                end if;
                
            elsif(n="1101") then -- 0 4 6

                if (sigA1 = "00100011") then -- 0 4 7 major
                    signal_c <= add_sig1_c;
                    long_signal_c <= long_add_sig1_c;
                    n <= "1100";
                
                elsif (diff_c = "0100") then -- 0 4 6 8 throw 2
                    data_valid <= '1';
                    
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    long_signal_a <= long_signal_c;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "1111";
                
                elsif (diff_c = "0100") then -- 0 4 6 9 throw 2
                    data_valid <= '1';
                    
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    long_signal_a <= long_signal_c;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "0010";    

                elsif (diff_c = "0100") then -- 0 4 6 10 throw 2
                    data_valid <= '1';
                    
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    long_signal_a <= long_signal_c;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "0011";

                elsif (diff_c = "0100") then -- 0 4 6 11 throw 2
                    data_valid <= '1';
                    
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    long_signal_a <= long_signal_c;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "0100";

                else -- 0 4 6 12 throw 3 
                    data_valid <= '1';
                    
                    output <= long_signal_a;
                    output_buffer <= long_signal_b;
                    output_buffer_next <= long_signal_c;

                    signal_a <= sig1;
                    long_signal_a <= sigA1;

                    n <= "0001";
                end if;

            elsif (n="1100") then -- 0 4 7 
                if (sigA1 = "00100011") then -- 0 4 8 
                    data_valid <= '1';
                        
                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;
                    
                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "0011";

                elsif (diff_c = "0011") then -- 0 4 7 10
                    signal_d <= sig1;
                    long_signal_d <= sigA1;
                    n <= "1000"; -- check for #
                    
                else -- 0 4 7 12 throw 2 0 M
                    data_valid <= '1';

                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= "01001101";
                    else
                        output <= long_signal_a;
                        output_buffer <= "01001101";
                    end if;

                    signal_a <= sig1;
                    long_signal_a <= sigA1;

                    n <= "0001";

                end if;

            elsif (n = "1011") then --  0 5 6
                if (sigA1 = "00100011") then -- 0 5 7 
                    signal_c <= add_sig1_c;
                    long_signal_c <= long_add_sig1_c;
                    n <= "1001";
                elsif(diff_c = "0010") then -- 0 5 6 8 throw first two
                    data_valid <= '1';
                        
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    long_signal_a <= long_signal_c;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "1111";

                elsif(diff_c = "0011") then -- 0 5 6 9 throw first two
                    data_valid <= '1';
                            
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    long_signal_a <= long_signal_c;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "0010";
                elsif(diff_c = "0100") then -- 0 5 6 10 throw first two
                    data_valid <= '1';
                            
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    long_signal_a <= long_signal_c;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                        
                    n <= "0011";

                elsif(diff_c = "0101") then -- 0 5 6 11 throw first two
                        
                    data_valid <= '1';
                            
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= long_signal_b;
                    else
                        output <= long_signal_a;
                        output_buffer <= long_signal_b;
                    end if;

                    signal_a <= signal_c;
                    long_signal_a <= long_signal_c;

                    signal_b <= sig1;
                    long_signal_b <= sigA1;

                    n <= "0100";

                else --  0 5 6 12 throw three
                        
                    data_valid <= '1';
                        
                    output <= long_signal_a;
                    output_buffer <= long_signal_b;
                    output_buffer_next <= long_signal_c;

                    signal_a <= sig1;
                    long_signal_a <= sigA1;

                    n <= "0001";

                end if;
                

            elsif (n = "1010") then -- 0 3 7
                if (sigA1 = "00100011") then -- 0 3 8 throw 1 go to 0 5
                    data_valid <= '1';
                    
                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;

                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= add_sig1_c;
                    long_signal_b <= long_add_sig1_c;

                    n <= "0100";
                
                else -- throw 0 m 
                            
                    data_valid <= '1';

                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= "01101101";
                    else
                        output <= long_signal_a;
                        output_buffer <= "01101101";
                    end if;

                    signal_a <= sig1;
                    long_signal_a <= sigA1;
                    n <= "0001";

                end if;
                
            elsif (n = "1001") then -- 0 5 7
                if (sigA1 = "00100011") then -- 0 5 8 throw 0 go to 0 3
                    data_valid <= '1';
                
                    if(output_buffer /= "00000000") then
                        output_buffer_next <= long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer <= long_signal_a;
                    else
                        output <= long_signal_a;
                    end if;

                    signal_a <= signal_b;
                    long_signal_a <= long_signal_b;
                    signal_b <= add_sig1_c;
                    long_signal_b <= long_add_sig1_c;

                    n <= "0010";
            
                else -- throw 0 s 
                    
                    data_valid <= '1';

                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= "01110011";
                    else
                        output <= long_signal_a;
                        output_buffer <= "01110011";
                    end if;

                    signal_a <= sig1;
                    long_signal_a <= sigA1;
                    n <= "0001";

                end if;
            
            elsif (n="1000") then -- 0 4 7 10
                if (sigA1 = "00100011") then -- 0 4 7 11 throw 0 M
                    data_valid <= '1';

                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= "01001101";
                    else
                        output <= long_signal_a;
                        output_buffer <= "01001101";
                    end if;

                    signal_a <= add_sig1_d;
                    long_signal_a <= long_add_sig1_d;

                    n <= "0001";

                else -- 0 4 7 10 12 throw 0 7
                    data_valid <= '1';
                    
                    if(output /= "00000000") then
                        output_buffer <= long_signal_a;
                        output_buffer_next <= "00110111";
                    else
                        output <= long_signal_a;
                        output_buffer <= "00110111";
                    end if;

                    signal_a <= sig1;
                    long_signal_a <= sigA1;

                    n <= "0001";

                end if;

            end if;

        end if;
    end process;

end architecture;