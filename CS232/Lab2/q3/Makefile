GHDL=ghdl
FLAGS="--std=08"

all:
	$(GHDL) -a $(FLAGS) -fsynopsys inverted_map.vhd sub12.vhd map.vhd CHORD.vhd CHORD_test.vhd
	$(GHDL) -e $(FLAGS) -fsynopsys CHORD_test
	$(GHDL) -r $(FLAGS) -fsynopsys CHORD_test --wave=wave.ghw --stop-time=10000ns

clean:
	rm -rf wave.ghw work-obj08.cf out.txt