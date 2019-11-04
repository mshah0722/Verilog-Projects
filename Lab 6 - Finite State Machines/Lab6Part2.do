# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in Lab6Part2.v to working dir
# could also have multiple verilog files
vlog Lab6Part2.v

#load simulation using mux as the top level simulation module
vsim Lab6Part2

#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

# force {clk} 0 0ns , 1 {5ns} -r 10ns
# The first commands sets clk to after 0ns, then sets it to 1 after 5ns. This cycle repeats after 10ns.
force {CLOCK_50} 1 0ns , 0 {5ns} -r 10ns

#===========================================================
#Dont change this
force {CLOCK_50} 0 0ns, 1 {10ns} -r 20ns

#Only change the SW values

#============ Case 0: A = 0,  B = 0, C = 0 , X = 0 ==========
#==================== Reset ================================
force {KEY[0]} 0
run 20 ns
#==================== Load A ================================
force {KEY[0]} 1
force {KEY[1]} 0
force {SW[7:0]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load B ================================
force {SW[7:0]} 0
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load C ================================
force {SW[7:0]} 0
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load X ================================
force {SW[7:0]} 0
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 100ns

#============ Case 1: A = 1,  B = 1, C = 1 , X = 1 ==========
#==================== Reset ================================
force {KEY[0]} 0
run 20 ns
#==================== Load A ================================
force {KEY[0]} 1
force {KEY[1]} 0
force {SW[7:0]} 1
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load B ================================
force {SW[7:0]} 1
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load C ================================
force {SW[7:0]} 1
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load X ================================
force {SW[7:0]} 1
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 100ns

#============ Case 2: A = 1,  B = 7, C = 7 , X = 6 ==========
#==================== Reset ================================
force {KEY[0]} 0
run 20 ns
#==================== Load A ================================
force {KEY[0]} 1
force {KEY[1]} 0
force {SW[7:0]} 1
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load B ================================
force {SW[7:0]} 111
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load C ================================
force {SW[7:0]} 111
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load X ================================
force {SW[7:0]} 110
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 100ns

#============ Case 3: A = 6,  B = 6, C = 4 , X = 6 ==========
#==================== Reset ================================
force {KEY[0]} 0
run 20 ns
#==================== Load A ================================
force {KEY[0]} 1
force {KEY[1]} 0
force {SW[7:0]} 110
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load B ================================
force {SW[7:0]} 110
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load C ================================
force {SW[7:0]} 100
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load X ================================
force {SW[7:0]} 110
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 100ns

#============ Case 4: A = 6,  B = 6, C = 3 , X = 6 ==========
#==================== Reset ================================
force {KEY[0]} 0
run 20 ns
#==================== Load A ================================
force {KEY[0]} 1
force {KEY[1]} 0
force {SW[7:0]} 110
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load B ================================
force {SW[7:0]} 110
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load C ================================
force {SW[7:0]} 11
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
#==================== Load X ================================
force {SW[7:0]} 110
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 20ns
force {KEY[1]} 0
run 20ns
force {KEY[1]} 1
run 100ns
