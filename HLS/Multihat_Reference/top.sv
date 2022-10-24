module top (clk, reset, out);
    input logic clk, reset;
    output logic [15:0] out;

    logic [31:0] tb_in32_1, tb_in32_2, tb_in32_3, tb_in32_4;
    logic [15:0] tb_out1, tb_out2, tb_out3, tb_out4;
    logic [127:0] regs;
    assign regs = {tb_in32_4, tb_in32_3, tb_in32_2, tb_in32_1};
    my_lfsr C1 (.clk(clk), .reset(reset), .out_32_1(tb_in32_1), .out_32_2(tb_in32_2), 
                    .out_32_3(tb_in32_3), .out_32_4(tb_in32_4));

    hat_mul C2 (.clk(clk), .reset(reset), .in_32(tb_in32_1), .out_16(tb_out1));
    hat_mul C3 (.clk(clk), .reset(reset), .in_32(tb_in32_2), .out_16(tb_out2));
    hat_mul C4 (.clk(clk), .reset(reset), .in_32(tb_in32_3), .out_16(tb_out3));
    hat_mul C5 (.clk(clk), .reset(reset), .in_32(tb_in32_4), .out_16(tb_out4));

    adder_block C6 (.clk(clk), .in0(tb_out1), .in1(tb_out2), 
                        .in2(tb_out3), .in3(tb_out4), .outp(out));

endmodule

module top_tb();
    logic clk, reset;
    logic [15:0] out;

    parameter delay = 10;

    integer i, f;

    top dut (.*);

    initial begin // Set up the clock
        clk <= 1'b0;
        forever #(delay/2) clk <= ~clk;
    end

    initial begin
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        f = $fopen("OutputHex1.txt", "w");
        for (i = 0; i < 250; i++) begin
            $fwrite(f, "%h\n", out);
            @(posedge clk);
        end
        $stop;
    end

endmodule