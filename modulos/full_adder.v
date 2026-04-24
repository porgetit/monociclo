/*
    Full Adder
    Un sumador completo con acarreo de entrada y salida.
    Entradas:
        - a: primer bit de entrada
        - b: segundo bit de entrada
        - cin: bit de acarreo de entrada (carry in)
    Salidas:
        - sum: resultado de la suma de los tres bits de entrada
        - cout: bit de acarreo de salida (carry out)
*/

module full_adder (
    input wire a,
    input wire b,
    input wire cin, // carry in
    output wire sum,
    output wire cout // carry out
);

// La suma es el resultado de la operación XOR entre las tres entradas
assign sum = a ^ b ^ cin;

// El carry out se calcula usando la fórmula: cout = (a AND b) OR (cin AND (a XOR b))
assign cout = (a & b) | (cin & (a ^ b));
endmodule
