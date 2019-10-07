vlib work
vlog lab3part2.v
vsim FourRCA
log {/*}
add wave {/*}
 
# Sum => 1 = 1 + 0
force {IN[0]} 0
force {IN[1]} 0
force {IN[2]} 0
force {IN[3]} 0
 
force {IN[4]} 1
force {IN[5]} 0
force {IN[6]} 0
force {IN[7]} 0
 
force {IN[8]} 0
run 10ns
 
# Sum => 2 = 1 + 1
force {IN[0]} 1
force {IN[1]} 0
force {IN[2]} 0
force {IN[3]} 0
 
force {IN[4]} 1
force {IN[5]} 0
force {IN[6]} 0
force {IN[7]} 0
 
force {IN[8]} 0
run 10ns
 
#Sum => 4 = 2 + 2
force {IN[0]} 0
force {IN[1]} 1
force {IN[2]} 0
force {IN[3]} 0
 
force {IN[4]} 0
force {IN[5]} 1
force {IN[6]} 0
force {IN[7]} 0
 
force {IN[8]} 0
run 10ns
 
#Sum => 8 = 4 + 4
force {IN[0]} 0
force {IN[1]} 0
force {IN[2]} 1
force {IN[3]} 0
 
force {IN[4]} 0
force {IN[5]} 0
force {IN[6]} 1
force {IN[7]} 0
 
force {IN[8]} 0
run 10ns

#Sum => 16 = 8 + 8
force {IN[0]} 0
force {IN[1]} 0
force {IN[2]} 0
force {IN[3]} 1
 
force {IN[4]} 0
force {IN[5]} 0
force {IN[6]} 0
force {IN[7]} 1

#Sum => 27 = 15 + 12
force {IN[0]} 0
force {IN[1]} 0
force {IN[2]} 1
force {IN[3]} 1
 
force {IN[4]} 1
force {IN[5]} 1
force {IN[6]} 1
force {IN[7]} 1
 
force {IN[8]} 0
run 10ns
 
#All LED/INitch turn 1
force {IN[0]} 1
force {IN[1]} 1
force {IN[2]} 1
force {IN[3]} 1
 
force {IN[4]} 1
force {IN[5]} 1
force {IN[6]} 1
force {IN[7]} 1 

force {IN[8]} 1
run 10ns
 
#Sum => 21 = 6 + 15
force {IN[0]} 1
force {IN[1]} 1
force {IN[2]} 1
force {IN[3]} 1
 
force {IN[4]} 0
force {IN[5]} 1
force {IN[6]} 1
force {IN[7]} 0
 
force {IN[8]} 0
run 10ns
