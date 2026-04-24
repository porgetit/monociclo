/*
    Full Adder 32 bits
    Un sumador completo de 32 bits usando ripple carry.
    Entradas:
        - a: primer número de 32 bits
        - b: segundo número de 32 bits
    Salidas:
        - sum: resultado de la suma de los dos números de 32 bits
*/

module full_adder_32 (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] result
);

wire [32:0] carry; // Vector de acarreo, con un bit adicional para el acarreo final

// El acarreo de entrada es 0
assign carry[0] = 1'b0;

// Instaciar 32 Full Adders
genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin : g_fa_bits
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
