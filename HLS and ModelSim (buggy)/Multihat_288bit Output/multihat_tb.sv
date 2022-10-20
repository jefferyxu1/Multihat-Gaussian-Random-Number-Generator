`timescale 1ns/10ps

module multihat_tb();
    logic ap_clk;
    logic ap_rst;
    logic ap_start;
    logic ap_done;
    logic ap_idle;
    logic ap_ready;
    logic [287:0] ap_return;
    logic [15:0] out, tb_out1, tb_out2, tb_out3,tb_out4, c2z,c2z1, c2z2, c3z, c3z1, c3z2, 
                    c4z, c4z1, c4z2, c5z, c5z1, c5z2;
    logic [3:0] sel4, sel3, sel2, sel1;
    integer i, f;
    parameter ClockDelay = 10;

    multihat dut (.*);

    assign c5z = ap_return[287:272];
    assign c5z1 = ap_return[271:256];
    assign c5z2 = ap_return[255:240];
    assign c4z = ap_return[239:224];
    assign c4z1 = ap_return[223:208];
    assign c4z2 = ap_return[207:192];
    assign c3z = ap_return[191:176];
    assign c3z1 = ap_return[175:160];
    assign c3z2 = ap_return[159:144];
    assign c2z = ap_return[143:128];
    assign c2z1 = ap_return[127:112];
    assign c2z2 = ap_return[111:96];

    assign sel4 = ap_return[95:92];
    assign sel3 = ap_return[91:88];
    assign sel2 = ap_return[87:84];
    assign sel1 = ap_return[83:80];

    assign out = ap_return[79:64];

    assign tb_out1 = ap_return[63:48];
    assign tb_out2 = ap_return[47:32];
    assign tb_out3 = ap_return[31:16];
    assign tb_out4 = ap_return[15:0];

    initial begin // Set up the clock
        ap_clk <= 1'b0;
        forever #(ClockDelay/2) ap_clk <= ~ap_clk;
    end

    initial begin
        ap_rst <= 1'b1; @(posedge ap_clk);
        ap_rst <= 1'b0; ap_start <= 1'b1; @(posedge ap_clk);
        f = $fopen("Output.txt", "w");
        for (i = 0; i < 100; i++) begin
            $fwrite(f, "%h\n", ap_return[79:64]);
            @(posedge ap_clk);
        end
        $stop;
    end
    
endmodule

/*
module multihat_tb();
    logic ap_clk;
    logic ap_rst;
    logic ap_start;
    logic ap_done;
    logic ap_idle;
    logic ap_ready;
    logic [63:0] ap_return;

    logic [15:0] out1, out2, out3, out4;
    assign out1 = ap_return[63:48];
    assign out2 = ap_return[47:32];
    assign out3 = ap_return[31:16];
    assign out4 = ap_return[15:0];

    integer i;
    parameter ClockDelay = 10;

    multihat dut (.*);

    initial begin // Set up the clock
        ap_clk <= 1'b0;
        forever #(ClockDelay/2) ap_clk <= ~ap_clk;
    end

    initial begin
        ap_rst <= 1'b1; @(posedge ap_clk);
        ap_rst <= 1'b0; ap_start <= 1'b1; @(posedge ap_clk);
        
        for (i = 0; i < 250; i++) begin
            @(posedge ap_clk);
        end
        $stop;
    end
    
endmodule
*/