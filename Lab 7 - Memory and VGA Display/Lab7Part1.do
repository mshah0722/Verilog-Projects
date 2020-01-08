# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in Lab7Part1.v to working dir
# could also have multiple verilog files
vlog Lab7Part1.v ram32x4.v

#load simulation using mux as the top level simulation module
vsim -L altera_mf_ver Lab7Part1

#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

force {KEY[0]} 0
force {KEY[0]} 1

# Test Case #1 - All keys set to zero and running clock input
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
force {SW[9]} 0
force {KEY[0]} 0
force {KEY[0]} 1
run 10ns

# Test Case #2 - Setting input data to C and running clock input without Write/Enable input
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
force {SW[9]} 0
force {KEY[0]} 0
force {KEY[0]} 1
run 10ns

# Test Case #3 - Setting input data to C and running clock input with Write/Enable input
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
force {SW[9]} 1
force {KEY[0]} 0
force {KEY[0]} 1
run 10ns

# Test Case #4 - Setting input data to D and running clock input without Write/Enable input
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
force {SW[9]} 1
force {KEY[0]} 0
force {KEY[0]} 1
run 10ns

# Test Case #5 - Setting input data to A, Memory Input to C, Write/Enable input on and having clock input off
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 1
force {KEY[0]} 0
run 10ns

# Test Case #6 - Setting input data to A, Memory Input to C, Write/Enable input on and having clock input on
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 1
force {KEY[0]} 1
run 10ns

# Test Case #7 - Setting input data to 0, Memory Input to C, Write/Enable input off and having clock input on
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 0
force {KEY[0]} 0
force {KEY[0]} 1
run 10ns

# Test Case #8 - Turning clock off and Write/Enable input on
force {KEY[0]} 0
force {SW[9]} 0
run 10ns

# Test Case #9 - Setting input data to B and running clock input without Write/Enable input at Memory Input 0
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
force {SW[9]} 0
force {KEY[0]} 0
force {KEY[0]} 1
run 10ns

# Test Case #10 - Setting input data to B and running clock input without Write/Enable input at Memory Input C
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 0
force {KEY[0]} 0
force {KEY[0]} 1
run 10ns

# Test Case #11 - Setting input data to B and running clock input with Write/Enable input at Memory Input C
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[8]} 0
force {SW[9]} 1
force {KEY[0]} 0
force {KEY[0]} 1
run 10ns