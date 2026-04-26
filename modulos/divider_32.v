/*
    Módulo: divider_32
    Descripción: Divisor de 32 bits

    Método: División larga (Long Division Algorithm)

    Entradas:
        - dividend: Número de 32 bits a dividir (a)
        - divisor: Número de 32 bits divisor (b)
    Salidas:
        - quotient: Cociente de la división (32 bits)
*/

module divider_32 (
    input wire [31:0] dividend,     // Dividendo (a)
    input wire [31:0] divisor,      // Divisor (b)
    output wire [31:0] quotient,    // Cociente
    output wire [31:0] remainder,   // Resto
    output wire division_by_zero    // Flag: ¿división por cero?
);

    // Detectar división por cero
    assign division_by_zero = (divisor == 32'h0);

    // Si divisor es 0, cociente y resto son x
    assign quotient = division_by_zero ? 32'hxxxxxxxx : (dividend / divisor);
    assign remainder = division_by_zero ? 32'hxxxxxxxx : (dividend % divisor);

endmodule
