# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux2to1.v to working dir
vlog mux2to1.v

#load simulation using mux2to1 as the top level simulation module
vsim mux2to1

#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

#First test case ((0,0,0) -> 0) S = 0, LEDR = X  
force {SW[0]} 0 
force {SW[1]} 0 
force {SW[9]} 0 
run 10ns 

#Second test case ((0,1,0) -> 0)  S = 0, LEDR = X  
force {SW[0]} 0 
force {SW[1]} 1 
force {SW[9]} 0 
run 10ns 
 
#Third test case ((1,0,0) -> 1)  S = 0, LEDR = X  
force {SW[0]} 1 
force {SW[1]} 0 
force {SW[9]} 0 
run 10ns 

#Fourth test case ((1,1,0) -> 1)  S = 0, LEDR = X  
force {SW[0]} 1 
force {SW[1]} 1 
force {SW[9]} 0 
run 10ns 

#Fifth test case ((0,0,1) -> 0)  S = 1, LEDR = Y  
force {SW[0]} 0 
force {SW[1]} 0 
force {SW[9]} 1 
run 10ns 

#Sixth test case ((1,0,1) -> 0)  S = 1, LEDR = Y  
force {SW[0]} 1 
force {SW[1]} 0 
force {SW[9]} 1 
run 10ns 

#Seventh test case ((0,1,1) -> 1)  S = 1, LEDR = Y 
force {SW[0]} 0 
force {SW[1]} 1 
force {SW[9]} 1 
run 10ns 

#Eighth test case ((1,1,1) -> 1)  S = 1, LEDR = Y  
force {SW[0]} 1 
force {SW[1]} 1 
force {SW[9]} 1 
run 10ns 

#Only 8 test cases since there are 3 inputs and 2^3 outputs