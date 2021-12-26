onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbdownscale/TM
add wave -noupdate /tbdownscale/RstB
add wave -noupdate /tbdownscale/Clk
add wave -noupdate -radix hexadecimal /tbdownscale/Bm2DsData
add wave -noupdate /tbdownscale/Bm2DsEn
add wave -noupdate -radix hexadecimal /tbdownscale/Ds2DsFfData
add wave -noupdate /tbdownscale/Ds2DsFfEn
add wave -noupdate /tbdownscale/u_DownScale/rState
add wave -noupdate -radix unsigned /tbdownscale/u_DownScale/rPixCnt
add wave -noupdate /tbdownscale/u_DownScale/rRowCnt
add wave -noupdate /tbdownscale/u_DownScale/rIgnorePixCnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {62436000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {61674300 ps} {63855300 ps}
