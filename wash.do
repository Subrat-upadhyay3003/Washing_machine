vlib work
vlog wash_rtl.sv +acc
vlog wash_tb.sv +acc
vsim work.wash_tb
add wave -r *
run -all
