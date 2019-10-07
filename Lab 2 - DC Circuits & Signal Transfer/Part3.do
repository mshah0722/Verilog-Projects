# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in Part3.v to working dir
vlog Part3.v

#load simulation using displayLight as the top level simulation module
vsim Part3

#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

#First test case (Hex Digit -> 0) 
force {SW[0]} 0 
force {SW[1]} 0  
force {SW[2]} 0  
force {SW[3]} 0  
run 10ns 
 
#First test case (Hex Digit -> 1) 
force {SW[0]} 1 
force {SW[1]} 0  
force {SW[2]} 0  
force {SW[3]} 0  
run 10ns 

#First test case (Hex Digit -> 2) 
force {SW[0]} 0 
force {SW[1]} 1  
force {SW[2]} 0  
force {SW[3]} 0  
run 10ns 
 
#First test case (Hex Digit -> 3) 
force {SW[0]} 1 
force {SW[1]} 1  
force {SW[2]} 0  
force {SW[3]} 0  
run 10ns 
  
#First test case (Hex Digit -> 4) 
force {SW[0]} 0 
force {SW[1]} 0  
force {SW[2]} 1  
force {SW[3]} 0  
run 10ns 
 
#First test case (Hex Digit -> 5) 
force {SW[0]} 1 
force {SW[1]} 0  
force {SW[2]} 1  
force {SW[3]} 0  
run 10ns 
 
#First test case (Hex Digit -> 6) 
force {SW[0]} 0 
force {SW[1]} 1  
force {SW[2]} 1  
force {SW[3]} 0  
run 10ns 
 
#First test case (Hex Digit -> 7) 
force {SW[0]} 1 
force {SW[1]} 1  
force {SW[2]} 1  
force {SW[3]} 0  
run 10ns 
 
#First test case (Hex Digit -> 8) 
force {SW[0]} 0 
force {SW[1]} 0  
force {SW[2]} 0  
force {SW[3]} 1 
run 10ns 
 
#First test case (Hex Digit -> 9) 
force {SW[0]} 1 
force {SW[1]} 0  
force {SW[2]} 0  
force {SW[3]} 1  
run 10ns 
 
#First test case (Hex Digit -> A) 
force {SW[0]} 0 
force {SW[1]} 1  
force {SW[2]} 0  
force {SW[3]} 1  
run 10ns 
 
#First test case (Hex Digit -> b) 
force {SW[0]} 1 
force {SW[1]} 1  
force {SW[2]} 0  
force {SW[3]} 1 
run 10ns 

#First test case (Hex Digit -> C) 
force {SW[0]} 0 
force {SW[1]} 0  
force {SW[2]} 1  
force {SW[3]} 1  
run 10ns 
 
#First test case (Hex Digit -> d) 
force {SW[0]} 1 
force {SW[1]} 0  
force {SW[2]} 1  
force {SW[3]} 1  
run 10ns 
 
#First test case (Hex Digit -> E) 
force {SW[0]} 0 
force {SW[1]} 1  
force {SW[2]} 1  
force {SW[3]} 1  
run 10ns 
 
#First test case (Hex Digit -> F) 
force {SW[0]} 1 
force {SW[1]} 1  
force {SW[2]} 1  
force {SW[3]} 1  
run 10ns
