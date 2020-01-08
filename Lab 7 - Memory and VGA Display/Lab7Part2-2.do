# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog fill.v

#load simulation using mux as the top level simulation module
vsim -L altera_mf_ver datapath

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}
# force {clk} 0 0ns , 1 {5ns} -r 10ns
# The first commands sets clk to after 0ns, then sets it to 1 after 5ns. This cycle repeats after 10ns.
force {clk} 0 0ns , 1 {5ns} -r 10ns
# Reset State
force {lx} 0
force {ly} 0
force {lc} 0
force {lb} 0
force {plot} 0
force {xin} 000000
force {yin} 000000
force {colour} 000
force {resetn} 0
run 10ns
# Set clr, x, y
force {lx} 1
force {ly} 1
force {lc} 1
force {lb} 0
force {plot} 0
force {xin} 011110
force {yin} 101011
force {colour} 101
force {resetn} 1
run 10ns
# Display Square
force {lx} 0
force {ly} 0
force {lc} 0
force {lb} 0
force {plot} 1
force {resetn} 1
run 160ns
# Clear Display
force {lx} 0
force {ly} 0
force {lc} 0
force {lb} 1
force {plot} 0
force {resetn} 1
run 10ns