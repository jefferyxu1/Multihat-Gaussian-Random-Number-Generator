onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /my_lfsr_tb/clk
add wave -noupdate /my_lfsr_tb/delay
add wave -noupdate /my_lfsr_tb/i
add wave -noupdate -radix decimal /my_lfsr_tb/out_32_1
add wave -noupdate -radix decimal /my_lfsr_tb/out_32_2
add wave -noupdate -radix decimal /my_lfsr_tb/out_32_3
add wave -noupdate -radix decimal /my_lfsr_tb/out_32_4
add wave -noupdate /my_lfsr_tb/reset
add wave -noupdate -expand /my_lfsr_tb/dut/regs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {166524 ps} 0}
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
WaveRestoreZoom {0 ps} {8463 ns}
