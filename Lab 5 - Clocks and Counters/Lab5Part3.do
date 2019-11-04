# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog Lab5Part3.v

#load simulation using mux as the top level simulation module
vsim Lab5Part3

#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

# force {clk} 0 0ns , 1 {5ns} -r 10ns

# The first commands sets clk to after 0ns, then sets it to 1 after 5ns. This cycle repeats after 10ns.

#Change the values to SW[0] SW[1] SW[2] to simulate the different letters

force {enable} 0 0ns , 1 {250ms} -r 500ms
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {KEY[0]} 1
force {KEY[1]} 1
run 10ns

force {KEY[1]} 0
run 10ns

force {KEY[1]} 1
run 6500ms