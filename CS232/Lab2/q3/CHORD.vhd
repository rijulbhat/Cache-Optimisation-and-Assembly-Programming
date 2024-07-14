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
    signal sig1, signal_a, signal_b, signal_c, signal_d, diff_a, diff_b, diff_c, diff_d: std_logic_vector (3 downto 0);
    signal add_sig1_a, add_sig1_b, add_sig1_c, add_sig1_d: std_logic_vector(3 downto 0);
    signal long_add_sig1_a, long_add_sig1_b, long_add_sig1_c, long_add_sig1_d : std_logic_vector(7 downto 0);
    signal long_signal_a, long_signal_b, long_signal_c, long_signal_d : std_logic_vector (7 downto 0);
    signal sig_output_buffer, sig_output_buffer_next, sig_output_buffer_last : std_logic_vector (7 downto 0) := "00000000";

    component mapping is
        port(
            ebit_input: in std_logic_vector(7 downto 0);
            fbit_output: out std_logic_vector(3 downto 0)
        );
    end component;

    component sub_mod_12 is 
        port (
            in3, in4 : in std_logic_vector (3 downto 0);
            out2 : out std_logic_vector (3 downto 0)
        );
    end component;

    component add_mod_12 is
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
    mapped: mapping port map(a, sig1);
    difference_a: sub_mod_12 port map(sig1, signal_a, diff_a);
    difference_b: sub_mod_12 port map(sig1, signal_b, diff_b);
    difference_c: sub_mod_12 port map(sig1, signal_c, diff_c);
    difference_d: sub_mod_12 port map(sig1, signal_d, diff_d);
    add_one_a: add_mod_12 port map(signal_a,"0001", add_sig1_a);
    add_one_b: add_mod_12 port map(signal_b,"0001",add_sig1_b);
    add_one_c: add_mod_12 port map(signal_c,"0001",add_sig1_c);
    add_one_d: add_mod_12 port map(signal_d,"0001",add_sig1_d);
    invert_mapped_a: inverted_mapping port map(add_sig1_a,long_add_sig1_a);
    invert_mapped_b: inverted_mapping port map(add_sig1_b,long_add_sig1_b);
    invert_mapped_c: inverted_mapping port map(add_sig1_c,long_add_sig1_c);
    invert_mapped: inverted_mapping port map(add_sig1_d, long_add_sig1_d);
    
    process (clk, a, sig1, add_sig1_a, long_add_sig1_a, add_sig1_b, long_add_sig1_b, add_sig1_c, long_add_sig1_c, add_sig1_d, long_add_sig1_d, diff_a, diff_b) -- Add variables, rising edge
        variable output, sigA1 : std_logic_vector (7 downto 0) := "00000000";
        variable output_buffer : std_logic_vector (7 downto 0) := sig_output_buffer;
        variable output_buffer_next : std_logic_vector (7 downto 0) := sig_output_buffer_next;
        variable output_buffer_last : std_logic_vector (7 downto 0) := sig_output_buffer_last;
    
        procedure add_to_buffer(n_throws : in std_logic_vector (1 downto 0)) is
            begin
                
                if (n_throws = "00") then
                    if(output_buffer_next /= "00000000") then
                        output_buffer_last := long_signal_a;
                    elsif(output_buffer /= "00000000") then
                        output_buffer_next := long_signal_a;
                    elsif(output /= "00000000") then
                        output_buffer := long_signal_a;
                    else
                        output := long_signal_a;
                    end if;
    
                elsif (n_throws = "01") then
                    if(output_buffer /= "00000000") then
                        output_buffer_next := long_signal_a;
                        output_buffer_last := long_signal_b;
                    elsif(output /= "00000000") then
                        output_buffer := long_signal_a;
                        output_buffer_next := long_signal_b;
                    else
                        output := long_signal_a;
                        output_buffer := long_signal_b;
                    end if;
    
                elsif (n_throws = "10") then
                    if(output /= "00000000") then
                        output_buffer := long_signal_a;
                        output_buffer_next := long_signal_b;
                        output_buffer_last := long_signal_c;
                    else
                        output := long_signal_a;
                        output_buffer := long_signal_b;
                        output_buffer_next := long_signal_c;
                    end if;
    
                elsif (n_throws = "11") then
                    output := long_signal_a;
                    output_buffer := long_signal_b;
                    output_buffer_next := long_signal_c;
                    output_buffer_last := long_signal_d;
                end if;
            end add_to_buffer;
        
        procedure add_to_buffer_chord(chord : in std_logic_vector(7 downto 0)) is
        begin

            if(output_buffer /= "00000000") then
                output_buffer_next := long_signal_a;
                output_buffer_last := chord;
            elsif(output /= "00000000") then
                output_buffer := long_signal_a;
                output_buffer_next := chord;
            else
                output := long_signal_a;
                output_buffer := chord;
            end if;
            
        end add_to_buffer_chord;


        procedure new_vals(new_a : in std_logic_vector(3 downto 0); long_new_a : in std_logic_vector(7 downto 0); new_b : in std_logic_vector(3 downto 0) := "0000"; long_new_b : in std_logic_vector (7 downto 0) := "00000000"; new_c : in std_logic_vector(3 downto 0) := "0000"; long_new_c : in std_logic_vector (7 downto 0) := "00000000"; new_d : in std_logic_vector(3 downto 0) := "0000"; long_new_d : in std_logic_vector (7 downto 0) := "00000000") is 
        begin
            signal_a <= new_a;
            long_signal_a <= long_new_a;
            signal_b <= new_b;
            long_signal_b <= long_new_b;
            signal_c <= new_c;
            long_signal_c <= long_new_c;
            signal_d <= new_d;
            long_signal_d <= long_new_d;
        end new_vals;

    begin
        if rising_edge(clk) then
            
            data_valid <= '0';
            output := "00000000";
            
            if (output_buffer /= "00000000") then
               
                data_valid <= '1';
                output := output_buffer;
                output_buffer := output_buffer_next;
                output_buffer_next := output_buffer_last;
                output_buffer_last := "00000000";
                
            end if;
            
            sigA1 := a;

            if (n = "0000") then -- null
                signal_a <= sig1;
                long_signal_a <= sigA1;
                n <= "0001"; -- C E F #

            elsif (n="0001") then -- 0

                if (sigA1 = "00011111") then
                    signal_a <= add_sig1_a;
                    long_signal_a <= long_add_sig1_a;
                    n <= "0001";

                elsif (diff_a = "0010") then -- 0 2
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "1111";
                
                elsif (diff_a = "0011") then -- 0 3
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0010";
        
                elsif (diff_a = "0100") then -- 0 4
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0011";
                    

                elsif (diff_a = "0101") then -- 0 5
                    signal_b <= sig1;
                    long_signal_b <= sigA1;
                    n <= "0100";
        
                else -- throw 0 
                    data_valid <= '1';
                    add_to_buffer("00");
                    new_vals(sig1, sigA1);
                    n <= "0001";

                end if;

            elsif (n = "1111") then -- 0 2
                if (sigA1 = "00011111") then
                    signal_b <= add_sig1_b;
                    long_signal_b <= long_add_sig1_b;
                    n <= "0010";
                elsif (diff_b = "0010") then -- 0 2 4
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "1111";
                elsif (diff_b = "0011") then -- 0 2 5
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "0010";
                elsif (diff_b = "0100") then -- 0 2 6
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "0011";
                elsif (diff_b = "0101") then -- 0 2 7
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "0100";
                else
                    add_to_buffer("01"); -- 0 2 8
                    new_vals(sig1, sigA1);
                    n <= "0001";    
                end if;
                
            elsif (n="0010") then -- 0 3
                    
                if (sigA1 = "00011111") then -- if next is # then go to maybe major chord c c+4
                    signal_b <= add_sig1_b;
                    long_signal_b <= long_add_sig1_b;
                    n <= "0011";

                elsif (diff_b = "0100") then -- it is a minor chord check for #
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1010";
                
                elsif (diff_b = "0010") then -- not a minor chord throw first c c+3 c+2
                    add_to_buffer("01");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "1111";
                
                elsif (diff_b = "0011") then -- maybe minor chord c c+3 c+6
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1110"; -- check for #

                elsif (diff_b = "0101") then -- c c+3 c+8 throw first
                    add_to_buffer("01");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "0100";
                
                else -- c c+3 c+4(say) throw first two
                    add_to_buffer("01");
                    new_vals(sig1, sigA1);
                    n <= "0001";

                end if;

            elsif (n="1110") then -- 0 3 6

                if (sigA1 = "00011111") then -- 0 3 7 formed 
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1010"; -- check for #

                elsif (diff_c = "0100") then -- c c+3 c+6 c+10 throw 1 then go to 0 3 7
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, signal_c, long_signal_c, sig1, sigA1);
                    n <= "1010";

                elsif (diff_c = "0010") then -- c c+3 c+6 c+8 so throw out first two

                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "1111";

                elsif (diff_c = "0011") then -- c c+3 c+6 c+9
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, signal_c, long_signal_c, sig1, sigA1);
                    n <= "1110";
                
                elsif (diff_c = "0101") then -- c c+3 c+6 c+11 throw first two
                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "0100";

                end if;
                
            elsif (n = "0011") then-- 0 4

                if (sigA1 = "00011111") then -- c c+5 formed go to 0100
                    signal_b <= add_sig1_b;
                    long_signal_b <= long_add_sig1_b;
                    n <= "0100";
                elsif (diff_b = "0010") then -- c c+4 c+6 check for major
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1101";
                elsif (diff_b = "0011") then -- c c+4 c+7 check for major or 7 
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1100";
                elsif (diff_b = "0100") then -- c c+4 c+8 throw first
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "0011";
                elsif (diff_b = "0101") then -- c c+4 c+9 throw first 
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "0100";
                else -- else throw first two
                    add_to_buffer("01");
                    new_vals(sig1, sigA1);
                    n <= "0001";
                end if;
            
            elsif(n = "0100") then -- 0 5
                if (sigA1 = "00011111") then -- 0 6 throw first
                    add_to_buffer("00");
                    new_vals(sig1, sigA1);
                    n <= "0001";
                
                elsif(diff_b = "0010") then -- 0 5 7 check for # 
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1001";

                elsif(diff_b = "0001") then -- 0 5 6 wait for next input
                    signal_c <= sig1;
                    long_signal_c <= sigA1;
                    n <= "1011";

                elsif(diff_b = "0011") then -- 0 5 8 throw 1
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "0010";

                elsif(diff_b = "0100") then -- 0 5 9 throw 1
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, sig1, sigA1);
                    n <= "0011";
                
                else -- 0 5 11 throw 2 
                    add_to_buffer("01");
                    new_vals(sig1, sigA1);
                    n <= "0001";
                end if;
                
            elsif(n="1101") then -- 0 4 6

                if (sigA1 = "00011111") then -- 0 4 7 major
                    signal_c <= add_sig1_c;
                    long_signal_c <= long_add_sig1_c;
                    n <= "1100";
                
                elsif (diff_c = "0100") then -- 0 4 6 8 throw 2
                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "1111";
                
                elsif (diff_c = "0100") then -- 0 4 6 9 throw 2
                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "0010";    

                elsif (diff_c = "0100") then -- 0 4 6 10 throw 2
                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "0011";

                elsif (diff_c = "0100") then -- 0 4 6 11 throw 2
                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "0100";

                else -- 0 4 6 12 throw 3 
                    add_to_buffer("10");
                    new_vals(sig1, sigA1);
                    n <= "0001";
                end if;

            elsif (n="1100") then -- 0 4 7 
                if (sigA1 = "00011111") then -- 0 4 8 
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, add_sig1_c, long_add_sig1_c);
                    n <= "0011";
                
                elsif (diff_c = "0010") then -- 0 4 7 9
                    signal_d <= sig1;
                    long_signal_d <= sigA1;
                    n <= "0111"; -- if # after this

                elsif (diff_c = "0011") then -- 0 4 7 10
                    signal_d <= sig1;
                    long_signal_d <= sigA1;
                    n <= "1000"; -- check for #
                    
                else -- 0 4 7 12 throw 2 0 M
                    add_to_buffer_chord("01001101");
                    new_vals(sig1, sigA1);
                    n <= "0001";

                end if;

            elsif (n = "1011") then --  0 5 6
                if (sigA1 = "00011111") then -- 0 5 7 
                    signal_c <= add_sig1_c;
                    long_signal_c <= long_add_sig1_c;
                    n <= "1001";
                elsif(diff_c = "0010") then -- 0 5 6 8 throw first two
                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "1111";

                elsif(diff_c = "0011") then -- 0 5 6 9 throw first two
                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "0010";

                elsif(diff_c = "0100") then -- 0 5 6 10 throw first two
                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "0011";

                elsif(diff_c = "0101") then -- 0 5 6 11 throw first two
                    add_to_buffer("01");
                    new_vals(signal_c, long_signal_c, sig1, sigA1);
                    n <= "0100";

                else --  0 5 6 12 throw three
                    add_to_buffer("10");
                    new_vals(sig1, sigA1);
                    n <= "0001";

                end if;
                

            elsif (n = "1010") then -- 0 3 7

                if (sigA1 = "00011111") then -- 0 3 8 throw 1 go to 0 5
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, add_sig1_c, long_add_sig1_c);
                    n <= "0100";
                
                else -- throw 0 m 
                    add_to_buffer_chord("01101101");
                    new_vals(sig1, sigA1);
                    n <= "0001";

                end if;

            elsif (n = "1001") then -- 0 5 7
                if (sigA1 = "00011111") then -- 0 5 8 throw 0 go to 0 3
                    add_to_buffer("00");
                    new_vals(signal_b, long_signal_b, add_sig1_c, long_add_sig1_c);
                    n <= "0010";
            
                else -- throw 0 s 
                    add_to_buffer_chord("01110011");
                    new_vals(sig1, sigA1);
                    n <= "0001";
                end if;
            
            elsif (n="1000") then -- 0 4 7 10
                
                if (sigA1 = "00011111") then -- 0 4 7 11 throw 0 M
                    add_to_buffer_chord("01001101");
                    new_vals(add_sig1_d, long_add_sig1_d);
                    n <= "0001";

                else -- 0 4 7 10 12 throw 0 7
                    add_to_buffer_chord("00110111");
                    new_vals(sig1, sigA1);
                    n <= "0001";

                end if;

            elsif (n = "0111") then
                
                if (sigA1 = "00011111") then -- 0 4 7 10 formed
                    signal_d <= add_sig1_d;
                    long_signal_d <= long_add_sig1_d;
                    n <= "1000";
                
                elsif (diff_d = "0010") then -- 0 4 7 9 11 throw 3
                    add_to_buffer_chord("01001101");
                    new_vals(signal_d, long_signal_d, sig1, sigA1);
                    n <= "1111";
                elsif (diff_d = "0011") then
                    add_to_buffer_chord("01001101");
                    new_vals(signal_d, long_signal_d, sig1, sigA1);
                    n <= "0010";
                elsif (diff_d = "0100") then
                    add_to_buffer_chord("01001101");
                    new_vals(signal_d, long_signal_d, sig1, sigA1);
                    n <= "0011";
                elsif (diff_d = "0101") then
                    add_to_buffer_chord("01001101");
                    new_vals(signal_d, long_signal_d, sig1, sigA1);
                    n <= "0100";
                
                else -- 0 4 7 9 10 
                    add_to_buffer_chord("01001101");
                    output_buffer_next := long_signal_d;
                    new_vals(sig1, sigA1);
                    n <= "0001";

                end if;
            end if;
            
            z <= output;
            sig_output_buffer <= output_buffer;
            sig_output_buffer_next <= output_buffer_next;
            sig_output_buffer_last <= output_buffer_last;
            
            if(output = "00000000") then
                data_valid <= '0';
            end if;

            if(output /= "00000000") then
                data_valid <= '1';
            end if;

        end if;
    end process;
end architecture;