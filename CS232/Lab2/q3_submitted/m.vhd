library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity ASCII_Read_test is
end entity;

architecture reader of ASCII_Read_test is
	component CHORDEncoder
	    port(clk, rst: in std_logic;
	    a: in std_logic_vector(7 downto 0);
	    data_valid: out std_logic;
	    z: out std_logic_vector(7 downto 0));
	end component;
	signal input_sig, output_sig: std_logic_vector (7 downto 0);
	signal clk, rst, data_valid : std_logic;
begin
	dut_instance: CHORDEncoder
		port map (a => input_sig, clk => clk, z => output_sig, data_valid => data_valid, rst => rst);
	
	process
		file input_file: text open read_mode is "C:\Users\muska\Desktop\input1.txt";
		file output_file: text open write_mode is "C:\Users\muska\Desktop\out.txt";
		variable input_line, output_line: line;
		variable input_var, output_var : std_logic_vector (7 downto 0);
		variable one_tick: integer := 0;	
		variable final: integer := 0;
	begin
		clk <= '0';
		while not endfile(input_file) loop
			wait for 1 ns;
			readline (input_file, input_line);
			wait for 1 ns;
			read (input_line, input_var);
			input_sig <= input_var;
			wait for 1 ns;
			clk <= '1';
			wait for 1 ns;
			clk <= '0';
			wait for 1 ns;
		end loop;

		while one_tick < 1 loop
			input_sig <= "00000000";
			wait for 1 ns;
			clk <= '1';
			wait for 1 ns;
			clk <= '0';
			wait for 1 ns;
			one_tick := one_tick + 1;
		end loop;

		while final < 32 loop
			input_sig <= "11111111";
			wait for 1 ns;
			clk <= '1';
			wait for 1 ns;
			clk <= '0';
			wait for 1 ns;
			final := final + 1;
			output_var := output_sig;
			wait for 1 ns;
			if(data_valid='1') then
				write (output_line, output_var);
				writeline (output_file, output_line);
			end if;
			wait for 1 ns;
			
		end loop;

	wait;
	end process;

end architecture;