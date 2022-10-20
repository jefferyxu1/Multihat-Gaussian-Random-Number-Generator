onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/clk
add wave -noupdate /top_tb/i
add wave -noupdate -radix decimal /top_tb/out
add wave -noupdate /top_tb/reset
add wave -noupdate -radix hexadecimal /top_tb/dut/tb_in32_1
add wave -noupdate -radix hexadecimal /top_tb/dut/tb_in32_2
add wave -noupdate -radix hexadecimal /top_tb/dut/tb_in32_3
add wave -noupdate -radix hexadecimal /top_tb/dut/tb_in32_4
add wave -noupdate -radix hexadecimal /top_tb/dut/tb_out1
add wave -noupdate -radix hexadecimal /top_tb/dut/tb_out2
add wave -noupdate -radix hexadecimal /top_tb/dut/tb_out3
add wave -noupdate -radix hexadecimal /top_tb/dut/tb_out4
add wave -noupdate -radix decimal /top_tb/dut/regs
add wave -noupdate -expand -group C2 /top_tb/dut/C2/a
add wave -noupdate -expand -group C2 /top_tb/dut/C2/b
add wave -noupdate -expand -group C2 /top_tb/dut/C2/c
add wave -noupdate -expand -group C2 /top_tb/dut/C2/d
add wave -noupdate -expand -group C2 /top_tb/dut/C2/z
add wave -noupdate -expand -group C2 /top_tb/dut/C2/z1
add wave -noupdate -expand -group C2 /top_tb/dut/C2/z2
add wave -noupdate -expand -group C3 /top_tb/dut/C3/a
add wave -noupdate -expand -group C3 /top_tb/dut/C3/b
add wave -noupdate -expand -group C3 /top_tb/dut/C3/c
add wave -noupdate -expand -group C3 /top_tb/dut/C3/d
add wave -noupdate -expand -group C3 /top_tb/dut/C3/z
add wave -noupdate -expand -group C3 /top_tb/dut/C3/z1
add wave -noupdate -expand -group C3 /top_tb/dut/C3/z2
add wave -noupdate -expand -group C4 /top_tb/dut/C4/a
add wave -noupdate -expand -group C4 /top_tb/dut/C4/b
add wave -noupdate -expand -group C4 /top_tb/dut/C4/c
add wave -noupdate -expand -group C4 /top_tb/dut/C4/d
add wave -noupdate -expand -group C4 /top_tb/dut/C4/z
add wave -noupdate -expand -group C4 /top_tb/dut/C4/z1
add wave -noupdate -expand -group C4 /top_tb/dut/C4/z2
add wave -noupdate -expand -group C5 /top_tb/dut/C5/a
add wave -noupdate -expand -group C5 /top_tb/dut/C5/b
add wave -noupdate -expand -group C5 /top_tb/dut/C5/c
add wave -noupdate -expand -group C5 /top_tb/dut/C5/d
add wave -noupdate -expand -group C5 /top_tb/dut/C5/z
add wave -noupdate -expand -group C5 /top_tb/dut/C5/z1
add wave -noupdate -expand -group C5 /top_tb/dut/C5/z2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17 ps} 0}
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
WaveRestoreZoom {0 ps} {126 ps}
