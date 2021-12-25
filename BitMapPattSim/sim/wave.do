onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbbitmappatt/TM
add wave -noupdate /tbbitmappatt/RstB
add wave -noupdate /tbbitmappatt/Clk
add wave -noupdate /tbbitmappatt/RxBmWrEn
add wave -noupdate /tbbitmappatt/RxBmWrData
add wave -noupdate /tbbitmappatt/BmFfWrEn
add wave -noupdate /tbbitmappatt/BmFfWrData
add wave -noupdate /tbbitmappatt/BmFfWrCnt
add wave -noupdate -radix unsigned /tbbitmappatt/u_BitMapPatt/rState
add wave -noupdate -radix unsigned /tbbitmappatt/u_BitMapPatt/rHeaderCnt
add wave -noupdate /tbbitmappatt/u_BitMapPatt/rBmFfWrEn
add wave -noupdate -radix hexadecimal /tbbitmappatt/u_BitMapPatt/rBmFfWrData
add wave -noupdate /tbbitmappatt/u_BitMapPatt/rRGBCnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {537449300 ps} 0}
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
WaveRestoreZoom {0 ps} {829441200 ps}
