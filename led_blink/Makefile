PRJ_DIR = $(realpath .)

PROJECT = led_blink
PIN_DEF = led_blink.pcf
DEVICE = hx8k
PACKAGE = ct256

DIR_BUILD = build
TOP_MODULE = led_blink
FILE_YOSYS = $(DIR_BUILD)/yosys.ys

# ---------- my targets


# generate netlist
synthesis:
	[ -d ./$(DIR_BUILD) ] || mkdir -p ./$(DIR_BUILD)
	@ touch yosys.ys
	@ echo 'read_verilog ./led_blink.v' >> $(FILE_YOSYS)
	@ echo 'hierarchy -check -auto-top' >> $(FILE_YOSYS)
	@ echo 'synth_ice40 -device hx -blif $(DIR_BUILD)/$(PROJECT).blif -json $(DIR_BUILD)/$(PROJECT).json' >> $(FILE_YOSYS)
	yosys $(FILE_YOSYS)

# place and route
implementation:
	nextpnr-ice40 --$(DEVICE) --package $(PACKAGE) --json $(DIR_BUILD)/$(PROJECT).json \
		--pcf $(PIN_DEF) --asc $(DIR_BUILD)/$(PROJECT).asc

# bitstream generation
bitstream:
	icepack $(DIR_BUILD)/$(PROJECT).asc $(DIR_BUILD)/$(PROJECT).bin

# timing report generation
reports:
	icetime -d $(DEVICE) -mtr $(DIR_BUILD)/rpt_$(PROJECT).rpt $(DIR_BUILD)/$(PROJECT).asc

# upload bitstream on board
upload:
	iceprog $(DIR_BUILD)/$(PROJECT).bin

run_all:
	make synthesis implementation reports bitstream

clean:
	@ rm -rfv $(DIR_BUILD)
	@ rm -rfv *.blif *.asc *.bin *.rpt *.ys

.PHONY: all prog clean

