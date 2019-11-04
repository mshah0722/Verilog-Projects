# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog Lab5Part1.v

#load simulation using mux as the top level simulation module
vsim Lab5Part1

#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

#Test Case 1 - Reset
#set SW[0] to 1 so it SW[0]s in the next clock cycle
force {SW[0]} 1
force {SW[1]} 0
force {KEY[0]} 0
run 10ns

# Test enable functionality, no addition with enable=0 while posedge clk 
force {KEY[0]} 1
run 10ns

# Test enable functionality, addition with enable=1 while posedge clk
force {SW[0]} 0
force {SW[1]} 1
force {KEY[0]} 0
run 10ns

force {KEY[0]} 1
run 10ns

force {KEY[0]} 0
run 10ns

force {KEY[0]} 1
run 10ns

force {KEY[0]} 0
run 10ns

force {KEY[0]} 1
run 10ns

# Test clear functionality, while enable=1
force {KEY[0]} 0
force {SW[0]} 1
run 10ns

force {KEY[0]} 1
run 10ns

# Add some value again, ideally repeat until 0xFF
force {KEY[0]} 0
force {SW[1]} 1
force {SW[0]} 0
run 10ns

force {KEY[0]} 1
run 10ns

force {KEY[0]} 0
run 10ns

force {KEY[0]} 1
run 10ns

force {KEY[0]} 0
run 10ns

force {KEY[0]} 1
run 10ns

# Test clear functionality while enable=0
force {SW[0]} 1
force {SW[1]} 0
force {KEY[0]} 0
run 10ns

force {KEY[0]} 1
run 10ns