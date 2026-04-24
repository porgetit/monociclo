/*
    Full Adder 24 bits
    Un sumador completo de 24 bits usando ripple carry.
    Entradas:
        - a: primer número de 24 bits
        - b: segundo número de 24 bits
    Salidas:
        - sum: resultado de la suma de los dos números de 24 bits
*/

module full_adder_24 (
    input wire [23:0] a,
    input wire [23:0] b,
    output wire [23:0] result
);

wire [24:0] carry; // Vector de acarreo, con un bit adicional para el acarreo final

// El acarreo de entrada es 0
assign carry[0] = 1'b0;

// Instaciar 24 Full Adders
genvar i;
generate
    for (i = 0; i < 24; i = i + 1) begin : g_fa_bits
        full_adder fa_inst (
            .a(a[i]),
            .b(b[i]),
            .cin(carry[i]),
            .sum(result[i]),
            .cout(carry[i + 1])
        );
    end
endgenerate
endmodule
