/*
    Módulo: mux2to1
    Descripción: Este módulo implementa un multiplexor de 2 a 1.
    Toma dos entradas (in0 e in1) y una señal de selección (sel) para determinar
    cuál de las dos entradas se transmite a la salida (out).
    Si sel es 0, out será igual a in0; si sel es 1, out será igual a in1.
*/

module mux2to1 (
    input wire in0,
    input wire in1,
    input wire sel,
    output wire out
);

// Lógica combinacional mux: out = (~sel & in0) | (sel & in1)
assign out = (~sel & in0) | (sel & in1);

endmodule
