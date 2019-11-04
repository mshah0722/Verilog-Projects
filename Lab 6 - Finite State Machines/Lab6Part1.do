# set the working dir, where all compiled verilog goes 
vlib work 

# compile all verilog modules in Lab6Part1.v to working dir 
# could also have multiple verilog files 
vlog Lab6Part1.v 
 
#load simulation using mux as the top level simulation module 
vsim Lab6Part1 

#log all signals and add some signals to waveform window 
log {/*}

# add wave {/*} would add all items in top level simulation module 
add wave {/*} 
 
#clock high 
force {KEY[0]} 0
 
#resetn
force {SW[0]} 0 
run 10ns

#clock low 
force {KEY[0]} 1 
run 10ns

#resetn
force {SW[0]} 1
run 10ns

#clock high 
force {KEY[0]} 0 

#force w high
force {SW[1]} 1 
run 10ns

#clock low
force {KEY[0]} 1
run 10ns

#clock high 
force {KEY[0]} 0
 
#force w high
force {SW[1]} 1 
run 10ns

#clock low
force {KEY[0]} 1
run 10ns

#clock high 
force {KEY[0]} 0 

#force w high
force {SW[1]} 1 
run 10ns

#clock low
force {KEY[0]} 1
run 10ns

#clock high 
force {KEY[0]} 0 

#force w high
force {SW[1]} 1 
run 10ns

#clock low
force {KEY[0]} 1
run 10ns

# force {clk} 0 0ns , 1 {5ns} -r 10ns 
# The first commands sets clk to after 0ns, then sets it to 1 after 5ns. This cycle repeats after 10ns. 
force {KEY[0]} 0 0ns , 1 {5ns} -r 10ns 
 
# Lab Waveform 
force {SW[1]} 0 
force {SW[0]} 0 
run 5ns 
 
force {SW[0]} 1 
run 20ns 
 
force {SW[1]} 1 
run 40ns 
 
force {SW[1]} 0 
run 10ns 
 
force {SW[1]} 1 
run 10ns 
 
force {SW[1]} 0 
run 25ns  
 
# A to B 
force {SW[1]} 1 
run 10ns 
 
# B to C 
run 10ns 
 
# C to D 
run 10ns 
 
# D to E 
force {SW[1]} 0 
run 10ns 
 
# E to A 
run 10ns 
 
# A to F 
force {SW[1]} 1 
run 50ns 
 
# Reset 
force {SW[0]} 0 
run 20ns 
