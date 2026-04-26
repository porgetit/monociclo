/*
    Módulo: full_subtractor
    Descripción: Restador completo de 1 bit
    Entradas:
        - a: Primer bit a restar
        - b: Segundo bit a restar
        - bin: Borrow in (préstamo de la etapa anterior)
    Salidas:
        - diff: Resultado de la resta (diferencia)
        - bout: Borrow out (préstamo para la siguiente etapa)
*/

module full_subtractor (
    input wire a,
    input wire b,
    input wire bin,         // borrow_in
    output wire diff,       // diferencia
    output wire bout        // borrow_out
);

    // diff = a XOR b XOR bin
    assign diff = a ^ b ^ bin;

    // bout = (~a AND b) OR (bin AND (a XOR b))
    assign bout = (~a & b) | (bin & (a ^ b));

endmodule
