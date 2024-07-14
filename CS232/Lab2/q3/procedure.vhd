library ieee;
use ieee.std_logic_1164.all;

entity procedure_test is
    port ();
end entity;


architecture behaviour of procedure_test is 
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

    component sub_mod_123 is 
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
            ebit_input => a,
            fbit_output => sig1
        );
    
    difference_a: sub_mod_123
        port map(
            in3 => sig1,
            in4 => signal_a,
            out2 => diff_a
        );
    
    difference_b: sub_mod_123
        port map(
            in3 => sig1,
            in4 => signal_b,
            out2 => diff_b
        );

    difference_c: sub_mod_123
        port map(
            in3 => sig1,
            in4 => signal_c,
            out2 => diff_c
        );
    
    difference_d: sub_mod_123
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
    
    process (clk, a, sig1, add_sig1_a, long_add_sig1_a, add_sig1_b, long_add_sig1_b, add_sig1_c, long_add_sig1_c, add_sig1_d, long_add_sig1_d, diff_a, diff_b) -- Add variables, rising edge
        variable output, sigA1 : std_logic_vector (7 downto 0) := "00000000";
        variable output_buffer : std_logic_vector (7 downto 0) := sig_output_buffer;
        variable output_buffer_next : std_logic_vector (7 downto 0) := sig_output_buffer_next;
        variable output_buffer_last : std_logic_vector (7 downto 0) := sig_output_buffer_last;
        
        procedure add_to_buffer(n_throws : in std_logic_vector (1 downto 0); long_signal_a, long_signal_b, long_signal_c, long_signal_d : in std_logic_vector(7 downto 0); output, output_buffer, output_buffer_next, output_buffer_last : out std_logic_vector(7 downto 0)) is
        begin
            if (n_throws = "00") then
                if(output_buffer_next /= "0000000") then
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

        begin
            output
            add_to_buffer("00", long_signal_a, long_signal_b, long_signal_c, long_signal_d, output, output_buffer, output_buffer_next, output_buffer_last);
            report to_string(output);


end architecture;