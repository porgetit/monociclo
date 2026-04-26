/*
    Módulo: alu_32
    Descripción: Unidad Aritmética Lógica de 32 bits

    Entradas:
        - operand_a: Primer operando de 32 bits
        - operand_b: Segundo operando de 32 bits
        - alu_op: Código de operación (3 bits)
    Salidas:
        - result: Resultado de la operación (32 bits)
*/

module alu_32 (
    input wire [31:0] operand_a,
    input wire [31:0] operand_b,
    input wire [2:0] alu_op,        // Código de operación

    output wire [31:0] result,
    output wire [31:0] result_high, // Bits altos (para multiplicación)
    output wire zero_flag,
    output wire overflow_flag,
    output wire division_by_zero
);

    wire [31:0] add_result;
    wire [31:0] sub_result;
    wire [63:0] mul_result;
    wire [31:0] div_quotient, div_remainder;
    wire [31:0] and_result, or_result, xor_result, not_result;

    // =====================================================
    // OPERACIONES ARITMÉTICAS
    // =====================================================

    // Suma
    full_adder_32 adder (
        .a(operand_a),
        .b(operand_b),
        .result(add_result)
    );

    // Resta
    subtractor_32 subtractor (
        .a(operand_a),
        .b(operand_b),
        .result(sub_result)
    );

    // Multiplicación
    multiplier_32 multiplier (
        .a(operand_a),
        .b(operand_b),
        .result(mul_result)
    );

    // División
    divider_32 divider (
        .dividend(operand_a),
        .divisor(operand_b),
        .quotient(div_quotient),
        .remainder(div_remainder),
        .division_by_zero(division_by_zero)
    );

    // =====================================================
    // OPERACIONES LÓGICAS
    // =====================================================
    assign and_result = operand_a & operand_b;
    assign or_result = operand_a | operand_b;
    assign xor_result = operand_a ^ operand_b;
    assign not_result = ~operand_a;

    // =====================================================
    // MULTIPLEXOR DE RESULTADO
    // =====================================================
    assign result = (alu_op == 3'b000) ? add_result :
                    (alu_op == 3'b001) ? sub_result :
                    (alu_op == 3'b010) ? mul_result[31:0] :
                    (alu_op == 3'b011) ? div_quotient :
                    (alu_op == 3'b100) ? and_result :
                    (alu_op == 3'b101) ? or_result :
                    (alu_op == 3'b110) ? xor_result :
                    (alu_op == 3'b111) ? not_result : 32'h0;

    // Bits altos de la multiplicación
    assign result_high = mul_result[63:32];

    // =====================================================
    // FLAGS
    // =====================================================
    assign zero_flag = (result == 32'h0);
    assign overflow_flag =
        (alu_op == 3'b000) &
        ((operand_a[31] & operand_b[31] & ~add_result[31]) |
        (~operand_a[31] & ~operand_b[31] & add_result[31]));

endmodule
