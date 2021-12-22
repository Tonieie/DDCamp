onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbtestpatt/TM
add wave -noupdate /tbtestpatt/RstB
add wave -noupdate /tbtestpatt/Clk
add wave -noupdate /tbtestpatt/PattSel
add wave -noupdate /tbtestpatt/PattCmd
add wave -noupdate -radix hexadecimal -radixshowbase 0 /tbtestpatt/PattStartAddr
add wave -noupdate -radix hexadecimal -radixshowbase 0 /tbtestpatt/PattLength
add wave -noupdate /tbtestpatt/PattReq
add wave -noupdate /tbtestpatt/PattBusy
add wave -noupdate /tbtestpatt/PattFail
add wave -noupdate /tbtestpatt/MtDdrWrReq
add wave -noupdate /tbtestpatt/MtDdrWrBusy
add wave -noupdate /tbtestpatt/MtDdrWrAddr
add wave -noupdate /tbtestpatt/WrFfWrCnt
add wave -noupdate /tbtestpatt/WrFfWrEn
add wave -noupdate /tbtestpatt/WrFfWrData
add wave -noupdate /tbtestpatt/MtDdrRdReq
add wave -noupdate /tbtestpatt/MtDdrRdBusy
add wave -noupdate /tbtestpatt/MtDdrRdAddr
add wave -noupdate /tbtestpatt/RdFfRdCnt
add wave -noupdate /tbtestpatt/RdFfRdData
add wave -noupdate /tbtestpatt/RdFfRdEn
add wave -noupdate /tbtestpatt/rRdFfRdEn
add wave -noupdate /tbtestpatt/u_TestPatt/rState
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {241100 ps} 0}
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
WaveRestoreZoom {0 ps} {1005200 ps}
