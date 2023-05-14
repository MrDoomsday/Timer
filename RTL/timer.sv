module timer #(
    parameter FREQUENCY_VALUE = 50_000_000//in Hz
) (
    input logic clk,
    input logic reset_n,

    input 	logic [1:0]	 	avmms_address,
	input 	logic			avmms_write,
	input 	logic	[31:0]	avmms_writedata,
    input   logic   [3:0]   avmms_byteenable, 
	input 	logic			avmms_read,
	output 	logic 	[31:0]	avmms_readdata

);






endmodule