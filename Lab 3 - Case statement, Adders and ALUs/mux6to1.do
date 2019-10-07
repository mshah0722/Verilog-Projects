vlib work
vlog mux6to1.v
vsim mux6to1code
log {/*}
add wave {/*}

#Testing Input[0]
force {Input[0]} 1
force {Input[1]} 0
force {Input[2]} 0
force {Input[3]} 0
force {Input[4]} 0
force {Input[5]} 0

force {MuxSelect[0]} 0
force {MuxSelect[1]} 0
force {MuxSelect[2]} 0

run 10ns

#Testing Input[1]
force {Input[0]} 0
force {Input[1]} 1
force {Input[2]} 0
force {Input[3]} 0
force {Input[4]} 0
force {Input[5]} 0

force {MuxSelect[0]} 1
force {MuxSelect[1]} 0
force {MuxSelect[2]} 0

run 10ns

#Testing Input[2]
force {Input[0]} 0
force {Input[1]} 0
force {Input[2]} 1
force {Input[3]} 0
force {Input[4]} 0
force {Input[5]} 0

force {MuxSelect[0]} 0
force {MuxSelect[1]} 1
force {MuxSelect[2]} 0

run 10ns

#Testing Input[3]
force {Input[0]} 0
force {Input[1]} 0
force {Input[2]} 0
force {Input[3]} 1
force {Input[4]} 0
force {Input[5]} 0

force {MuxSelect[0]} 1
force {MuxSelect[1]} 1
force {MuxSelect[2]} 0

run 10ns

#Testing Input[4]
force {Input[0]} 0
force {Input[1]} 0
force {Input[2]} 0
force {Input[3]} 0
force {Input[4]} 1
force {Input[5]} 0

force {MuxSelect[0]} 0
force {MuxSelect[1]} 0
force {MuxSelect[2]} 1

run 10ns

#Testing Input[5]
force {Input[0]} 0
force {Input[1]} 0
force {Input[2]} 0
force {Input[3]} 0
force {Input[4]} 0
force {Input[5]} 1

force {MuxSelect[0]} 1
force {MuxSelect[1]} 0
force {MuxSelect[2]} 1

run 10ns


