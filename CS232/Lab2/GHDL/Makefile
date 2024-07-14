
GHDL=ghdl
FLAGS="--std=08"

all:
	$(GHDL) -a $(FLAGS) q1_mux4x1.vhd q1_or.vhd q1_not.vhd q1_and.vhd q1_mux4x1_tb.vhd
	$(GHDL) -e $(FLAGS) test_mux
	$(GHDL) -r $(FLAGS) test_mux --wave=wave_mux4x1.ghw --stop-time=32ns