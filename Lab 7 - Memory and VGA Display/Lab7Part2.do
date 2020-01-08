# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog Lab7Part2.v

#load simulation using mux as the top level simulation module
vsim -L altera_mf_ver control

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}
# force {clk} 0 0ns , 1 {5ns} -r 10ns
# The first commands sets clk to after 0ns, then sets it to 1 after 5ns. This cycle repeats after 10ns.
force {clk} 0 0ns , 1 {5ns} -r 10ns
# Reset State
force {go} 0
force {resetn} 0
run 10ns
# Stay at X_Load State
force {go} 0
force {resetn} 1
run 10ns
# Go to X_Load_Wait State
force {go} 1
force {resetn} 1
run 10ns
# Stay at X_Load_Wait State
force {go} 1
force {resetn} 1
run 10ns
# Go to Y_Load State
force {go} 0
force {resetn} 1
run 10ns
# Stay at Y_Load_Wait State
force {go} 1
force {resetn} 1
run 10ns
# Go to CYCLE_0
force {go} 0
force {resetn} 1
run 10ns
# Go to DONE
run 10ns
# Go to X_Load
run 10ns
# Test Reset
# Go to X_Load_Wait State
force {go} 1
force {resetn} 1
run 10ns
# Reset
force {go} 1
force {resetn} 0
run 10ns
# Go to X_Load_Wait State
force {go} 1
force {resetn} 1
run 10ns
# Stay at X_Load_Wait State
force {go} 1
force {resetn} 1
run 10ns
# Go to Y_Load State
force {go} 0
force {resetn} 1
run 10ns
# Stay at Y_Load_Wait State
force {go} 1
force {resetn} 1
run 10ns
# Reset
force {go} 0
force {resetn} 0
run 10ns