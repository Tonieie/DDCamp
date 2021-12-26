##
quit -sim
vlib work

#--------------------------------#
#--      Compile Source        --#
#--------------------------------#
vcom -work work ../source/BitMapPatt.vhd
vcom -work work ../source/RxSerial.vhd
vcom -work work ../source/DownScale.vhd

#--------------------------------#
#--     Compile Test Bench     --#
#--------------------------------#
vcom -work work ../Testbench/TbBitMapPatt.vhd

vsim -t 100ps -novopt work.TbBitMapPatt
view wave

do wave.do

view structure
view signals

run 1 ms

