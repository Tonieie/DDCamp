onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbrxserial/TM
add wave -noupdate /tbrxserial/Clk
add wave -noupdate /tbrxserial/SerDataIn
add wave -noupdate /tbrxserial/RxFfFull
add wave -noupdate -radix hexadecimal /tbrxserial/RxFfWrData
add wave -noupdate /tbrxserial/RxFfWrEn
add wave -noupdate /tbrxserial/u_RxSerial/rState
add wave -noupdate /tbrxserial/u_RxSerial/rSerDataIn
add wave -noupdate -radix hexadecimal /tbrxserial/u_RxSerial/rDataCnt
add wave -noupdate /tbrxserial/u_RxSerial/rRxFfWrEn
add wave -noupdate /tbrxserial/u_RxSerial/rBaudEnd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {36143800 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 221
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
WaveRestoreZoom {0 ps} {91900100 ps}
