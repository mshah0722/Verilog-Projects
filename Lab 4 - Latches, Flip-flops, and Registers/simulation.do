vlib work

vlog lab4part2.v

vsim lab4part2

log {/*}
add wave {/*}

#==============================================================
#Reset case
force {KEY[0]} 0
force {SW[9]} 0

#Inputs
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

#Alu
force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 1
run 10ns

#==============================================================
#Clock Off
force {KEY[0]} 1
run 10ns

#==============================================================
#Case 0, simple adder, shows register works
force {KEY[0]} 0
force {SW[9]} 1
#Alu
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 1

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
run 10ns

#==============================================================
#Clock Off
force {KEY[0]} 1
run 10ns

#==============================================================
#Case 0, Rippling adder, also shows register works
force {KEY[0]} 0

#Alu
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 1

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
run 10ns

#==============================================================
#Clock Off
force {KEY[0]} 1
run 10ns

#==============================================================
#Case 1, Adding to confirm the ripple adder is correct
force {KEY[0]} 0

#Alu
force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 1

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
run 10ns

#==============================================================
#Clock Off
force {KEY[0]} 1
run 10ns

#==============================================================
#Case 2
force {KEY[0]} 0

#Alu
force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 1

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
run 10ns

#==============================================================
#Clock Off
force {KEY[0]} 1
run 10ns

#==============================================================
#Case 6
force {KEY[0]} 0

#Alu
force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 0

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
run 10ns

#==============================================================
#Clock Off
force {KEY[0]} 1
run 10ns
#==============================================================
#Case 5
force {KEY[0]} 0

#Alu
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 0

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
run 10ns

#==============================================================
#Clock Off
force {KEY[0]} 1
run 10ns

#==============================================================
#Case 6
force {KEY[0]} 0

#Alu
force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 0

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
run 10ns

