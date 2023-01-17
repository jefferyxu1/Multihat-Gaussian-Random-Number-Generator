`timescale 1ns/10ps

// To testbench for different designs

module multihat_tb();
    logic ap_clk;
    logic ap_rst;
    logic ap_start;
    logic ap_done;
    logic ap_idle;
    logic ap_ready;
    logic reset;
    logic [129:0] seed_V;
    logic out_V_ap_vld;
    logic [15:0] out_V;
    integer i, f;
    parameter ClockDelay = 10;


    multihat dut (.*);

    initial begin // Set up the clock
        ap_clk <= 1'b0;
        forever #(ClockDelay/2) ap_clk <= ~ap_clk;
    end

    initial begin
	    ap_rst <= 1'b0; reset <= 1'b1; seed_V <= 130'h123456789bdefa2154acbd55a468daf5; @(posedge ap_clk);
        reset <= 1'b0; ap_start <= 1'b1; @(posedge ap_clk);
        f = $fopen("outputHex2.txt", "w");
        for (i = 0; i < 10; i++) begin
            $fwrite(f, "%h\n", out_V);
            @(posedge ap_clk);
        end
        ap_rst <= 1'b1; seed_V <= 130'd1; @(posedge ap_clk);
        ap_rst <= 1'b0; @(posedge ap_clk);
        repeat(10) @(posedge ap_clk);
        ap_rst <= 1'b1; seed_V <= 130'h123456789bdefa2154acbd55a468daf5; @(posedge ap_clk);
        ap_rst <= 1'b0; @(posedge ap_clk);
        repeat(10) @(posedge ap_clk);
        $stop;
    end
    
endmodule