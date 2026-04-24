/*
    Program Counter 32 bits
    Este módulo implementa la etapa del contador de programa (PC) en un procesador de paso 4.
    Entradas:
        - in: Entrada de 32 bits para el nuevo valor del PC.
        - wen: Señal de escritura (write enable) para actualizar el PC.
        - reset: Señal de reinicio para restablecer el PC a cero.
        - clk: Señal de reloj para sincronizar las operaciones.
    Salida:
        - out: Salida de 32 bits que representa el valor actual del PC.
*/

module pc_tb (
    input wire wen, reset, clk,
    output wire [31:0] address
);

wire [31:0] full_adder_result, pc_stage_out;

pc_stage pc_stage_inst (
    .in(full_adder_result),
    .wen(wen),
    .reset(reset),
    .clk(clk),
    .out(pc_stage_out)
);

full_adder_32 full_adder_inst (
    .a(32'b00000000000000000000000000000100), // Suma 4 bytes para avanzar al siguiente PC
    .b(pc_stage_out), // El valor actual del PC
    .result(full_adder_result)
);

assign address = pc_stage_out;
endmodule
