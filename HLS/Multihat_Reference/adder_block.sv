module adder_block(clk, in0, in1, in2, in3, outp);
    input logic clk;
    input logic [15:0] in0, in1, in2, in3;
    output logic [15:0] outp;

    logic [16:0] s00, s01, s10;
    assign s00 = {in0[15], in0} + {in1[15], in1};
    assign s01 = {in2[15], in2} + {in3[15], in3};

    always_ff @(posedge clk) begin
        s10 <= {s00[16], s00[16:1]} + {s01[16], s01[16:1]}; 
    end

    assign outp = s10[16:1];
endmodule

module adder_block_testbench();
    logic clk;
    logic [15:0] in0, in1, in2, in3, outp;

    parameter delay = 40000;

    integer i;

    adder_block dut (.clk, .in0, .in1, .in2, .in3, .outp);

    initial begin // Set up the clock
        clk <= 1'b0;
        forever #(delay/2) clk <= ~clk;
    end

    

    initial begin
        in0 <= 32'h0000;
        in1 <= 32'h0000;
        in2 <= 32'h0000;
        in3 <= 32'h0000;
        @(posedge clk);
        in0 <= 32'h0000;
        in1 <= 32'h0000;
        in2 <= 32'h0000;
        in3 <= 32'h0000;
        @(posedge clk);
        in0 <= 32'hdaf5;
        in1 <= 32'hfd55;
        in2 <= 32'hfa21;
        in3 <= 32'h1678;
        @(posedge clk);
        in0 <= 32'hcb83;
        in1 <= 32'h1255;
        in2 <= 32'h0a4a;
        in3 <= 32'he5b9;
        @(posedge clk);
        in0 <= 32'hcbe5;
        in1 <= 32'h07f8;
        in2 <= 32'he6c6;
        in3 <= 32'h09f2;
        @(posedge clk);
        in0 <= 32'he765;
        in1 <= 32'hc75e;
        in2 <= 32'h0ab4;
        in3 <= 32'h1bd1;
        @(posedge clk);
        in0 <= 32'h19e7;
        in1 <= 32'h3cef;
        in2 <= 32'h13df;
        in3 <= 32'hb569;
        @(posedge clk);
        in0 <= 32'hd92d;
        in1 <= 32'hf5e6;
        in2 <= 32'h1b73;
        in3 <= 32'h29c7;
        @(posedge clk);
        in0 <= 32'h18c4;
        in1 <= 32'he986;
        in2 <= 32'he828;
        in3 <= 32'he299;
        @(posedge clk);
        in0 <= 32'hfa67;
        in1 <= 32'h1569;
        in2 <= 32'h1b62;
        in3 <= 32'h023d;
        @(posedge clk);
        in0 <= 32'hfa8a;
        in1 <= 32'h2aaf;
        in2 <= 32'h2420;
        in3 <= 32'h0404;
        @(posedge clk);
        in0 <= 32'h05db;
        in1 <= 32'h0c4f;
        in2 <= 32'hef51;
        in3 <= 32'hdc01;
        @(posedge clk);
        in0 <= 32'hda82;
        in1 <= 32'h114b;
        in2 <= 32'hde7d;
        in3 <= 32'h189f;
        @(posedge clk);
        in0 <= 32'h0c83;
        in1 <= 32'h147e;
        in2 <= 32'h13db;
        in3 <= 32'he1ff;
        @(posedge clk);
        in0 <= 32'hc892;
        in1 <= 32'h0c65;
        in2 <= 32'hf96b;
        in3 <= 32'h1363;
        @(posedge clk);
        in0 <= 32'hfbb3;
        in1 <= 32'h209b;
        in2 <= 32'hf68c;
        in3 <= 32'he32a;
        @(posedge clk);
        in0 <= 32'hd6c9;
        in1 <= 32'hf449;
        in2 <= 32'h1fc8;
        in3 <= 32'hc6ae;
        @(posedge clk);
        in0 <= 32'hf7d8;
        in1 <= 32'hf985;
        in2 <= 32'hfe70;
        in3 <= 32'hc1bc;
        @(posedge clk);
        in0 <= 32'hd452;
        in1 <= 32'h034d;
        in2 <= 32'hf30b;
        in3 <= 32'h3733;
        @(posedge clk);
        in0 <= 32'h199d;
        in1 <= 32'hcb5e;
        in2 <= 32'h1502;
        in3 <= 32'h0ab3;
        @(posedge clk);
        $stop;
    end
endmodule