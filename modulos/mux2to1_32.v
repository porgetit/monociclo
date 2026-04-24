/*
    Módulo: mux2to1_32
    Descripción: Multiplexor 2-to-1 de 32 bits.
    Entradas:
        - in0: Primera entrada de 32 bits.
        - in1: Segunda entrada de 32 bits.
        - sel: Señal de selección (0 selecciona in0, 1 selecciona in1).
    Salida:
        - out: Salida de 32 bits que refleja la entrada seleccionada.
*/

module mux2to1_32 (
    input wire [31:0] in0,
    input wire [31:0] in1,
    input wire sel,
    output wire [31:0] out
);

genvar i;
generate
    for (i = 0; i< 32; i = i + 1) begin: g_mux_bits
        mux2to1 mux_bit (
            .in0(in0[i]),
            .in1(in1[i]),
            .sel(sel),
            .out(out[i])
        );
    end
    endgenerate
endmodule
