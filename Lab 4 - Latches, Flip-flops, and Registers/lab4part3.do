 # set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog lab4part3.v

#load simulation using mux as the top level simulation module
vsim part3

#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

#Case1 - Red Signal - No value assigned
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 1
force {KEY[0]} 1
force {KEY[3]} 1
force {KEY[2]} 1
force {KEY[1]} 1
run 10ns

#Case2 - Positive edge (all values are RESET to 0)
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 1 
force {KEY[0]} 0
force {KEY[3]} 1
force {KEY[2]} 1
force {KEY[1]} 1
run 10ns

#Case3 - Test to store values (3 LSBs are on, and clk signal is OFF) 
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 1
force {KEY[3]} 1
force {KEY[2]} 1
force {KEY[1]} 1
run 10ns

#case 4 - value of 3LSBs stored
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 0
force {KEY[3]} 1
force {KEY[2]} 1
force {KEY[1]} 1
run 10ns

#case 5 - Verification of stored values (Switches are off, but output of LEDR should be the same)
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 0
force {KEY[3]} 1
force {KEY[2]} 1
force {KEY[1]} 1
run 10ns

#case6 - rotate right (rotates right, on rising edge, when ParallelLoadN and RotateRight are high)
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 1
force {KEY[3]} 1
force {KEY[2]} 0
force {KEY[1]} 0
run 10ns

#case7 - rotate right - pos -  memory stored
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 0
force {KEY[3]} 1
force {KEY[2]} 0
force {KEY[1]} 0
run 10ns

#case8- rotate left 
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 1
force {KEY[3]} 1
force {KEY[2]} 1
force {KEY[1]} 0
run 10ns

#case9- rotate left - pos -  memory stored
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 0
force {KEY[3]} 1
force {KEY[2]} 1
force {KEY[1]} 0
run 10ns

#case10- Logical Shift Right
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 0
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
run 10ns

#case11- Output should be (0 SW[7] SW[6] SW[5] SW[4] SW[3] SW[2] SW[1], i.e., 00000011) after case 12
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 1
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
run 10ns

#case12- Logical Shift Right contd
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 0
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
run 10ns

#case13- Output should be (0 0 SW[7] SW[6] SW[5] SW[4] SW[3] SW[2], i.e., 00000001) after case 14
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 1
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
run 10ns

#case14- Logical Shift Right contd
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 0
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
run 10ns

#case15- Output should be (0 SW[7] SW[6] SW[5] SW[4] SW[3] 0 0, i.e., 00000000) after value stored(Case16)
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 1
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
run 10ns

#case16- Logical Shift Right contd
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0 
force {KEY[0]} 0
force {KEY[3]} 0
force {KEY[2]} 0
force {KEY[1]} 0
run 10ns

#case17+ Random Test Cases
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {KEY[0]} 1
run 10ns

force {KEY[1]} 0
force {KEY[2]} 0
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

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
force {KEY[1]} 1
force {KEY[0]} 0
run 10ns

force {KEY[0]} 1
run 10ns

force {KEY[1]} 0
force {KEY[3]} 1
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