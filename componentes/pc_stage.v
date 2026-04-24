/*
    PC Stage Module 32 bits
    Este módulo implementa la etapa del contador de programa (PC) en un procesador de paso 1.
    Entradas:
        - in: Entrada de 32 bits para el nuevo valor del PC.
        - wen: Señal de escritura (write enable) para actualizar el PC.
        - reset: Señal de reinicio para restablecer el PC a cero.
        - clk: Señal de reloj para sincronizar las operaciones.
    Salida:
        - out: Salida de 32 bits que representa el valor actual del PC.
*/

module pc_stage (
    input wire [31:0] in,
    input wire wen, reset, clk,
    output wire [31:0] out
);

wire enable_signal;
wire [31:0] mux1_out, mux2_out, dff_out;

mux2to1_32 mux1_inst (
    .in0(dff_out),
    .in1(in),
    .sel(wen),
    .out(mux1_out)
);

mux2to1_32 mux2_inst (
    .in0(mux1_out),
    .in1(32'b0),
    .sel(reset),
    .out(mux2_out)
);

and_gate and_inst (
    .a(wen),
    .b(reset),
    .out(enable_signal)
);

dff_enable_32 dff_inst (
    .d(mux2_out),
    .clk(clk),
    .en(enable_signal),
    .reset(reset),
    .q(dff_out)
);

assign out = dff_out;
endmodule
