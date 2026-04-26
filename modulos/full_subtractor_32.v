/*
    Módulo: subtractor_32
    Descripción: Restador de 32 bits usando ripple borrow
    Entradas:
        - a: Primer número de 32 bits a restar
        - b: Segundo número de 32 bits a restar
    Salidas:
        - result: Resultado de la resta (diferencia) de 32 bits
*/

module full_subtractor_32 (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] result
);

    wire [32:0] borrow;  // Vector de borrow, con bit adicional

    // Borrow de entrada es 0
    assign borrow[0] = 1'b0;

    // Instanciar 32 Full Subtractors
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : g_fs_bits
            full_subtractor fs_inst (
                .a(a[i]),
                .b(b[i]),
                .bin(borrow[i]),
                .diff(result[i]),
                .bout(borrow[i + 1])
            );
        end
    endgenerate

endmodule
