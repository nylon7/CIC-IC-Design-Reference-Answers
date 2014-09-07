onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /testbench/Value_out
add wave -noupdate -format Literal /testbench/Value_in
add wave -noupdate -format Literal -radix unsigned /testbench/Display
add wave -noupdate -format Literal -radix unsigned /testbench/Array_Value
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 183
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
update
WaveRestoreZoom {9375 ns} {10324 ns}
