onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /timer_tb/DUT/clk
add wave -noupdate /timer_tb/DUT/reset_n
add wave -noupdate -expand -group Avalon-MM /timer_tb/DUT/avmms_address
add wave -noupdate -expand -group Avalon-MM /timer_tb/DUT/avmms_write
add wave -noupdate -expand -group Avalon-MM /timer_tb/DUT/avmms_writedata
add wave -noupdate -expand -group Avalon-MM /timer_tb/DUT/avmms_byteenable
add wave -noupdate -expand -group Avalon-MM /timer_tb/DUT/avmms_read
add wave -noupdate -expand -group Avalon-MM /timer_tb/DUT/avmms_readdata
add wave -noupdate /timer_tb/DUT/coe_interrupt
add wave -noupdate -expand -group Debug -radix unsigned /timer_tb/DUT/counter
add wave -noupdate -expand -group Debug -radix unsigned /timer_tb/DUT/counter_reg
add wave -noupdate -expand -group Debug /timer_tb/DUT/complete
add wave -noupdate -expand -group Debug /timer_tb/DUT/busy
add wave -noupdate -expand -group Debug /timer_tb/DUT/start
add wave -noupdate -expand -group Debug /timer_tb/DUT/stop
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {510 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 162
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {484 ns} {1226 ns}
