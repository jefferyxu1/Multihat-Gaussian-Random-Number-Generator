module hat_mul(clk, reset, in_32, out_16);
    input logic clk, reset;
    input logic [31:0] in_32;
    output logic [15:0] out_16;

    logic [15:0] z, z1, z2;
    logic [3:0] sel;
    logic a, b;

    assign a = (in_32[20] | in_32[21] | in_32[22]) & in_32[23];
    assign b = in_32[24] & in_32[25] & in_32[26];
    assign c = (z1[14] ^ z1[15]) & (z1[13] ~^ z1[14]);
    assign d = (in_32[27] ^ z1[15]) & (in_32[28] ~^ in_32[27]);

    assign sel = {a, b, c, d};
    always_ff @(posedge clk) begin
        z[12:0] <= in_32[12:0];
        z[15] <= in_32[15];

        if (a == 1'b0) begin
           z[14:13] <= in_32[14:13]; 
        end
        else begin
            z[14:13] <= {in_32[15], in_32[15]};
        end

        // z1 update
        z1[13:0] <= z[13:0];
        z1[15] <= z[15];
        if (b == 1'b1) begin
            z1[14] <= z[14];
        end
        else begin
            z1[14] <= z[15];
        end

        // z2 update
        z2[12:0] <= z1[12:0];
        z2[15] <= z1[15];
        if (c == 1'b1) begin
            if (d == 1'b1 ) begin
                z2[14:13] <= in_32[30:29];
            end 
            else begin
                z2[14:13] <= in_32[28:27];
            end
        end
        else begin
            z2[14:13] <= z1[14:13];
        end
    end

    assign out_16 = z2;
endmodule

module hat_mul_testbench();
    logic clk, reset;
    logic [31:0] in_32;
    logic [15:0] out_16;

    parameter delay = 40000;

    integer i;

    hat_mul dut (.clk, .reset, .in_32, .out_16);

    initial begin // Set up the clock
        clk <= 1'b0;
        forever #(delay/2) clk <= ~clk;
    end

    initial begin // Set up the clock
        clk <= 1'b0;
        forever #(delay/2) clk <= ~clk;
    end

    initial begin
        reset <= 1'b1; in_32 <= 32'hA468DAF5;
        @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        @(posedge clk);
        in_32 <= 32'hFE21CB83; @(posedge clk);
        in_32 <= 32'h3E83CBE5; @(posedge clk);
        in_32 <= 32'h0E72A765; @(posedge clk);
        in_32 <= 32'h6B9F79E7; @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $stop;
    end
endmodule