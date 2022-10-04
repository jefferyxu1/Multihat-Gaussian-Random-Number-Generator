module my_lfsr(clk, reset, out_32_1, out_32_2, out_32_3, out_32_4);
    input logic clk, reset;
    output logic [31:0] out_32_1, out_32_2, out_32_3, out_32_4;

    logic [129:0] regs;
    
    always_ff @(posedge clk) begin

        if (reset)
            regs <= 130'h123456789bdefa2154acbd55a468daf5;
        else begin
            for (int i = 0; i < 120; i++)
                regs[i] <= regs[i + 7] ^ regs[i + 10];

            for (int i = 120; i < 130; i++)
                regs[i] <= regs[i - 120];
        end
    end

    assign out_32_1 = regs[31:0];
    assign out_32_2 = regs[63:32];
    assign out_32_3 = regs[95:64];
    assign out_32_4 = regs[127:96];

endmodule

module my_lfsr_tb();
    logic clk, reset;
    logic [31:0] out_32_1, out_32_2, out_32_3, out_32_4;

    my_lfsr dut (.*);

    parameter delay = 10;

    integer i;

    initial begin // Set up the clock
        clk <= 1'b0;
        forever #(delay/2) clk <= ~clk;
    end

    initial begin
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        repeat (200) @(posedge clk); 
        $stop;
    end

endmodule
