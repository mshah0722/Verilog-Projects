# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog vector.v

#load simulation using mux as the top level simulation module
vsim vector

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}
# force {clk} 0 0ns , 1 {5ns} -r 10ns
# The first commands sets clk to after 0ns, then sets it to 1 after 5ns. This cycle repeats after 10ns.
force {clk} 0 0ns , 1 {5ns} -r 10ns
# xin increment test without sufficent speedcount
force {speedcount} 000
force {rx} 0
force {xin} 1011000
run 10ns
# xin increment test with sufficent speedcount
force {speedcount} 010
force {rx} 0
force {xin} 1011000
run 10ns
# decrementing to incrementing change test
force {speedcount} 010
force {rx} 0
force {xin} 1111100
run 10ns
# xin decrement test with sufficent speedcount
force {speedcount} 010
force {rx} 1
force {xin} 101100
run 10ns
# xin decrement test without sufficent speedcount
force {speedcount} 000
force {rx} 1
force {xin} 101100
run 10ns
# incrementing to decrementing change test
force {speedcount} 010
force {rx} 1
force {xin} 0000000
run 10ns