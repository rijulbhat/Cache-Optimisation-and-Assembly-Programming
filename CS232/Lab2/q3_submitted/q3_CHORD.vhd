library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CHORDEncoder is
    Port (
        clk, rst: in std_logic;
        a: in std_logic_vector(7 downto 0);
        data_valid: out std_logic;
        z: out std_logic_vector(7 downto 0)
    );
end entity CHORDEncoder;

architecture Behavioral of CHORDEncoder is
         function ascii_to_integer(
        ascii : in std_logic_vector(7 downto 0))
        return integer is
        begin
            case ascii is
                when "01000001" =>
                    return 9;    --A
                when "01000010" => 
                    return 11; --B
                when "01000011" => 
                    return 0; --C
                when "01000100" =>
                    return 2; --D
                when "01000101" =>
                    return 4; --E
                when "01000110" =>
                    return 5; --F
                when "01000111" =>
                    return 7; --G
                when "01100001" =>
                    return 8; --a
                when "01100010" =>
                    return 10; --b
                when "01100100" =>
                    return 1; --d
                when "01100101" =>
                    return 3;  --e
                when "01100111" =>
                    return 6;  --g
                when "00011111" =>
                    return 12; --#
                when others =>
                    return (-1);
            end case;
        end;

    function integer_to_ascii(
        code : in integer)
        return std_logic_vector is
        begin
            case code is
                when 9 =>
                    return "01000001";
                when 11 =>
                    return "01000010";
                when 0 =>
                    return "01000011";
                when 2 =>
                    return "01000100";
                when 4 =>
                    return "01000101";
                when 5 =>
                    return "01000110";
                when 7 =>
                    return "01000111";
                when 8 =>
                    return "01100001";
                when 10 =>
                    return "01100010";
                when 1 =>
                    return "01100100";
                when 3 =>
                    return "01100101";
                when 6 =>
                    return "01100111";
                when 12 =>
                    return "00011111";
                when 13 =>
                    return  "00110111"; --7th
                when 14 =>
                    return "01001101"; --Major
                when 15 =>
                    return "01101101"; --minor
                when 16 =>
                    return "01110011"; --suspended
                when others =>
                    return "00000000"; --random just to get rid of error lmao
            end case;
        end;

        type integer_array is array (natural range <>) of integer;
        signal input_buffer: integer_array(0 to 31) := (others => (-1));
    
        begin
            process(clk, rst)
                variable current_byte: integer;
                variable temp_note: integer_array(0 to 3) := (others => (-1));
                variable temp_note_itr: integer := 0;
                variable first_byte: integer := -1;
                variable itr_input: integer := 0;
                variable itr_out: integer := 0;
                variable chord: integer := (-1); -- 0 for 7; 1 for major; 2 for minor; 3 for suspended
                variable final_outputs: integer_array(0 to 31) := (others => (-1));
                variable final_itr: integer := 0;
                variable now_output: integer := 0;
                variable handle_hash: integer :=0;
                begin
                    if rst = '1' then
                        input_buffer <= (others => (-1));
                    
                    elsif rising_edge(clk) then
                        if a = "01100110" then
                            current_byte := 4;
                            input_buffer(itr_input) <= current_byte;
                            itr_input := itr_input + 1;
                            data_valid <= '0';
                        
                        elsif a = "01100011" then
                            current_byte := 11;
                            input_buffer(itr_input) <= current_byte;
                            itr_input := itr_input + 1;
                            data_valid <= '0';

                        elsif ascii_to_integer(a) = 12 then
                            handle_hash := (input_buffer(itr_input - 1) + 1) mod 12;
                            input_buffer(itr_input - 1) <= handle_hash;
                            data_valid <= '0';
                        
                        elsif a /= "00000000" and a/= "11111111" then
                            current_byte := ascii_to_integer(a);
                            input_buffer(itr_input) <= current_byte;
                            itr_input := itr_input + 1;
                            data_valid <= '0';

                        elsif a = "00000000"  then
                        data_valid <= '0';      --- time to process inputs
                                                       
                        while itr_out < itr_input  loop

                            --preprocess and make chord of 4 
                            temp_note_itr := itr_out;

                            while temp_note_itr - itr_out < 4 loop         
                                temp_note(temp_note_itr - itr_out) := input_buffer(temp_note_itr);
                                temp_note_itr := temp_note_itr + 1;
                            end loop;
                            
                            first_byte := temp_note(0);
                            temp_note_itr := 0;
    
                            if temp_note(temp_note_itr + 1) = (first_byte + 4) mod 12 and
                               temp_note(temp_note_itr + 2) = (first_byte + 7) mod 12 and
                               temp_note(temp_note_itr + 3) = (first_byte + 10) mod 12
    
                               then --7th
                                chord := 0;
                                itr_out := itr_out + 4;
    
                            elsif temp_note(temp_note_itr + 1) = (first_byte + 4) mod 12 and
                                temp_note(temp_note_itr + 2) = (first_byte + 7) mod 12
    
                                then --MAJOR
                                 chord := 1;
                                 itr_out := itr_out + 3;
    
                            elsif temp_note(temp_note_itr + 1) = (first_byte + 3) mod 12 and
                                temp_note(temp_note_itr + 2) = (first_byte + 7) mod 12
    
                                then --MINOR
                                 chord := 2;
                                 itr_out := itr_out + 3;
    
                            elsif temp_note(temp_note_itr + 1) = (first_byte + 5) mod 12 and
                                temp_note(temp_note_itr + 2) = (first_byte + 7) mod 12
    
                                then --SUSPENDED
                                 chord := 3;
                                 itr_out := itr_out + 3;
    
                            else --no chord formed
                                chord := -1;
                                itr_out := itr_out + 1;
                            end if;

                            if chord = 0 --final_outputs me daalo
                            then
                                final_outputs(final_itr) := first_byte;
                                final_outputs(final_itr + 1) := 13; --7th
                                final_itr := final_itr + 2;
                            
                            elsif chord = 1
                            then
                                final_outputs(final_itr) := first_byte;
                                final_outputs(final_itr + 1) := 14; --Major
                                final_itr := final_itr + 2;
    
                            elsif chord = 2
                            then
                                final_outputs(final_itr) := first_byte;
                                final_outputs(final_itr + 1) := 15; --minor
                                final_itr := final_itr + 2;
    
                            elsif chord = 3
                            then
                                final_outputs(final_itr) := first_byte;
                                final_outputs(final_itr + 1) := 16; --suspended
                                final_itr := final_itr + 2;
    
                            else 
                                final_outputs(final_itr) := first_byte;
                                final_itr := final_itr + 1;

                        end if;
                        end loop;
                        
                        else
                        if now_output < final_itr + 1
                        then
                            if integer_to_ascii(final_outputs(now_output)) /= "00000000" then
                            z <= integer_to_ascii(final_outputs(now_output));
                            data_valid <= '1';
                            end if;

                            if integer_to_ascii(final_outputs(now_output)) = "00000000" then
                                data_valid <= '0';
                            end if;
                            now_output := now_output + 1;
                            
                        end if;
                            
                        end if;
                    end if;
                end process;
            end Behavioral;




            
                            