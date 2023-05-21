module timer_tb();

    localparam FREQUENCY_VALUE = 50_000_000;//in Hz




    reg clk;
    reg reset_n;

    reg     [1:0]	avmms_address;
	reg			    avmms_write;
	reg	    [31:0]	avmms_writedata;
    reg     [3:0]   avmms_byteenable; 
	reg			    avmms_read;
	wire 	[31:0]	avmms_readdata;

    wire           coe_interrupt;



    timer #(
        .FREQUENCY_VALUE(FREQUENCY_VALUE)//in Hz
    ) DUT (
        .clk    (clk),
        .reset_n(reset_n),

        .avmms_address      (avmms_address),
        .avmms_write        (avmms_write),
        .avmms_writedata    (avmms_writedata),
        .avmms_byteenable   (avmms_byteenable), 
        .avmms_read         (avmms_read),
        .avmms_readdata     (avmms_readdata),

        .coe_interrupt(coe_interrupt)
    );



    always begin
        clk = 1'b0;
        #10;
        clk = 1'b1;
        #10;
    end


    task mm_write(logic [1:0] address, logic [31:0] writedata);
        avmms_address = address;
        avmms_write = 1'b1;
        avmms_writedata = writedata;
        avmms_byteenable = 4'hF;
        @(posedge clk);
        avmms_address = 2'b00;
        avmms_write = 1'b0;
        avmms_writedata = 32'h0;
        avmms_byteenable = 4'h0;
        @(posedge clk);
    endtask //mm_write


    logic [63:0] timer_value;

    initial begin
        reset_n = 1'b0;
        timer_value = 10;
        avmms_address = 2'b00;
        avmms_write = 1'b0;
        avmms_writedata = 32'h0;
        avmms_byteenable = 4'h0;
        avmms_read = 1'b0;
        repeat(10) @ (posedge clk);
        reset_n = 1'b1;
        repeat(10) @ (posedge clk);
    //only start
        mm_write(2'h1, timer_value[31:0]);
        mm_write(2'h2, timer_value[63:32]);
        mm_write(2'h0, 32'h1);//send start
        repeat(100) @ (posedge clk);
    //start ond stop
        mm_write(2'h1, timer_value[31:0]);
        mm_write(2'h2, timer_value[63:32]);
        mm_write(2'h0, 32'h1);
        repeat(3) @ (posedge clk);
        mm_write(2'h0, 32'h2);
        repeat(100) @ (posedge clk);
        
        $stop;
    end


endmodule