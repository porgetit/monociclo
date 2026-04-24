module pc_stage (
    input wire [31:0] in0, in1,
    input wire sel0, sel1,
    input wire wen,
    input wire clk, reset,
    output wire [31:0] out
);

wire [31:0] stage1, stage2;
wire enable_signal;

mux2to1_32 mux1_inst (
    .in0(in0),
    .in1(in1),
    .sel(sel0),
    .out(stage1)
);

mux2to1_32 mux2_inst (
    .in0(stage1),
    .in1(in1),
    .sel(sel1),
    .out(stage2)
);

and_gate and_inst (
    .a(wen),
    .b(reset),
    .out(enable_signal)
);

dff_enable_32 dff_inst (
    .d(stage2),
    .clk(clk),
    .en(enable_signal),
    .q(out)
);

endmodule
