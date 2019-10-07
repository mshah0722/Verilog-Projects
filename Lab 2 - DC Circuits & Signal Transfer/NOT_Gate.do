# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux2to1.v to working dir
vlog mux2to1.v

#load simulation using v7404 as the top level simulation module
vsim V7404 

#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

#First test case (1 -> 0) 
force {pin1} 1 
run 10ns 

#Second test case (0 -> 1) 
force {pin1} 0 
run 10ns 

#Only two test cases required since NOT Gate has only two inputs and two outputs