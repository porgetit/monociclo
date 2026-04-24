/*
    PC Adder
    Un sumador para actualizar el puntero de programa.
    Entradas:
        - pc: puntero de programa actual de 32 bits
    Salidas:
        - next_pc: siguiente dirección de programa de 32 bits
*/

module pc_adder (
    input wire [31:0] pc,
    output wire [31:0] next_pc
);

wire [31:0] adder_b; // Segundo operando para el sumador

assign adder_b = 32'h00000004; // Incremento de 4 bytes para la siguiente instrucción

full_adder_32 adder (
    .a(pc),
    .b(adder_b),
    .result(next_pc)
);

endmodule
