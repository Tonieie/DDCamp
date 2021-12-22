onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbtxserial/TM
add wave -noupdate /tbtxserial/RstB
add wave -noupdate /tbtxserial/Clk
add wave -noupdate -radix hexadecimal -radixshowbase 0 /tbtxserial/TxFfEmpty
add wave -noupdate -radix hexadecimal -radixshowbase 0 /tbtxserial/TxFfRdData
add wave -noupdate /tbtxserial/TxFfRdEn
add wave -noupdate /tbtxserial/SerDataOut
add wave -noupdate /tbtxserial/u_TxSerial/rState
add wave -noupdate -expand /tbtxserial/u_TxSerial/rTxFfRdEn
add wave -noupdate -radix unsigned -childformat {{/tbtxserial/u_TxSerial/rDataCnt(3) -radix unsigned} {/tbtxserial/u_TxSerial/rDataCnt(2) -radix unsigned} {/tbtxserial/u_TxSerial/rDataCnt(1) -radix unsigned} {/tbtxserial/u_TxSerial/rDataCnt(0) -radix unsigned}} -radixshowbase 0 -subitemconfig {/tbtxserial/u_TxSerial/rDataCnt(3) {-height 15 -radix unsigned -radixshowbase 0} /tbtxserial/u_TxSerial/rDataCnt(2) {-height 15 -radix unsigned -radixshowbase 0} /tbtxserial/u_TxSerial/rDataCnt(1) {-height 15 -radix unsigned -radixshowbase 0} /tbtxserial/u_TxSerial/rDataCnt(0) {-height 15 -radix unsigned -radixshowbase 0}} /tbtxserial/u_TxSerial/rDataCnt
add wave -noupdate -radix binary -childformat {{/tbtxserial/u_TxSerial/rSerDataOut(9) -radix hexadecimal} {/tbtxserial/u_TxSerial/rSerDataOut(8) -radix hexadecimal} {/tbtxserial/u_TxSerial/rSerDataOut(7) -radix hexadecimal} {/tbtxserial/u_TxSerial/rSerDataOut(6) -radix hexadecimal} {/tbtxserial/u_TxSerial/rSerDataOut(5) -radix hexadecimal} {/tbtxserial/u_TxSerial/rSerDataOut(4) -radix hexadecimal} {/tbtxserial/u_TxSerial/rSerDataOut(3) -radix hexadecimal} {/tbtxserial/u_TxSerial/rSerDataOut(2) -radix hexadecimal} {/tbtxserial/u_TxSerial/rSerDataOut(1) -radix hexadecimal} {/tbtxserial/u_TxSerial/rSerDataOut(0) -radix hexadecimal}} -radixshowbase 0 -subitemconfig {/tbtxserial/u_TxSerial/rSerDataOut(9) {-height 15 -radix hexadecimal -radixshowbase 0} /tbtxserial/u_TxSerial/rSerDataOut(8) {-height 15 -radix hexadecimal -radixshowbase 0} /tbtxserial/u_TxSerial/rSerDataOut(7) {-height 15 -radix hexadecimal -radixshowbase 0} /tbtxserial/u_TxSerial/rSerDataOut(6) {-height 15 -radix hexadecimal -radixshowbase 0} /tbtxserial/u_TxSerial/rSerDataOut(5) {-height 15 -radix hexadecimal -radixshowbase 0} /tbtxserial/u_TxSerial/rSerDataOut(4) {-height 15 -radix hexadecimal -radixshowbase 0} /tbtxserial/u_TxSerial/rSerDataOut(3) {-height 15 -radix hexadecimal -radixshowbase 0} /tbtxserial/u_TxSerial/rSerDataOut(2) {-height 15 -radix hexadecimal -radixshowbase 0} /tbtxserial/u_TxSerial/rSerDataOut(1) {-height 15 -radix hexadecimal -radixshowbase 0} /tbtxserial/u_TxSerial/rSerDataOut(0) {-height 15 -radix hexadecimal -radixshowbase 0}} /tbtxserial/u_TxSerial/rSerDataOut
add wave -noupdate /tbtxserial/u_TxSerial/rBaudEnd
add wave -noupdate /tbtxserial/u_TxSerial/rBaudCnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8870000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 188
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
WaveRestoreZoom {6746700 ps} {10993400 ps}
