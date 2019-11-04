# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in Lab5Part2.v to working dir
# could also have multiple verilog files
vlog Lab5Part2.v

#load simulation using Lab5Part2 as the top level simulation module
vsim Lab5Part2

#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

# force {clk} 0 0ns , 1 {5ns} -r 10ns
# The first commands sets clk to after 0ns, then sets it to 1 after 5ns. This cycle repeats after 10ns.

# Have to run each set of commands individually, so comment one run statement and run the simulation then comment it again and uncomment another one

#Run this command for 50 MHz
force {CLOCK_50} 0 0ns , 1 {10ns} -r 20ns
force {SW[1]} 0
force {SW[0]} 1
#run 100ns

#Run this command for 2 Hz
force {SW[1]} 0
force {SW[0]} 1
#run 625000ps

#Run this command for 1 Hz
force {SW[1]} 1
force {SW[0]} 0
#run 1250000ps

#Run this command for 0.5 Hz
force {SW[1]} 1
force {SW[0]} 1
run 2500000ps