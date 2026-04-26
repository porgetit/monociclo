/*
    Módulo: multiplier_32
    Descripción: Multiplicador de 32 bits

    Método: Multiplicación por suma y desplazamiento (Booth algorithm simplificado)

    Entradas:
        - a: Primer número de 32 bits a multiplicar
        - b: Segundo número de 32 bits a multiplica
    Salidas:
        - result: Producto de la multiplicación (64 bits, ya que 32x32
*/

module multiplier_32 (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [63:0] result      // Producto de 64 bits (32+32)
);

    // Usar la multiplicación combinacional de Verilog
    // (El sintetizador optimizará esto automáticamente)
    assign result = a * b;

endmodule
