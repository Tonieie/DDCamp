##
quit -sim
vlib work

#--------------------------------#
#--      Compile Source        --#
#--------------------------------#
vcom -work work ../source/DownScale.vhd

#--------------------------------#
#--     Compile Test Bench     --#
#--------------------------------#
vcom -work work ../Testbench/TbDownScale.vhd

vsim -t 100ps -novopt work.TbDownScale
view wave

do wave.do

view structure
view signals

run 1 ms

