# set the working dir, where all compiled verilog goes
vlib work 

# compile all verilog modules in mux2to1.v to working dir
vlog mux2to1.v 

#load simulation using v7408 as the top level simulation module
vsim V7408 

#log all signals and add some signals to waveform window
log {/*} 

# add wave {/*} would add all items in top level simulation module
add wave {/*} 

#First test case ((0,0) -> 0) 
force {pin1} 0 
force {pin2} 0 
force {pin4} 0 
force {pin5} 0 
run 10ns 

#Second test case ((0,1) -> 0) 
force {pin1} 0 
force {pin2} 1 
force {pin4} 0 
force {pin5} 1 
run 10ns 
 
#Third test case ((1,0) -> 0) 
force {pin1} 1 
force {pin2} 0 
force {pin4} 1 
force {pin5} 0 
run 10ns 
  
#Fourth test case ((1,1) -> 1) 
force {pin1} 1 
force {pin2} 1 
force {pin4} 1 
force {pin5} 1 
run 10ns 

#Only four test cases since there are a 2^2 possible different scenarios