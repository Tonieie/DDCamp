##
quit -sim
vlib work

#--------------------------------#
#--      Compile Source        --#
#--------------------------------#
vcom -work work ../source/TestPatt.vhd

#--------------------------------#
#--     Compile Test Bench     --#
#--------------------------------#
vcom -work work ../Testbench/TbTestPatt.vhd

vsim -t 100ps -novopt work.TbTestPatt
view wave

#add wave *
do wave.do


view structure
view signals

run 100 us	

