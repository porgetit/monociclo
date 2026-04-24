/*
    Módulo: and_gate
    Descripción: Puerta lógica AND de dos entradas.
*/

module and_gate (
    input wire a,
    input wire b,
    output wire out
);

// Lógica combinacional AND: out = a & b
assign out = a & b;
endmodule
