/*
    Program Memory
    Módulo de memoria de programa que almacena las instrucciones del programa.
    Entradas:
        - address: dirección de la instrucción a leer (32 bits)
    Salidas:
        - instruction: instrucción leída de la memoria (32 bits)
*/

module program_memory (
    input wire [31:0] address,
    output wire [31:0] instruction
);

wire [23:0] full_adder_24_1_out, full_adder_24_2_out, full_adder_24_3_out;
wire [7:0] rom_24x8_1_out, rom_24x8_2_out, rom_24x8_3_out, rom_24x8_4_out;

// Instanciar los módulos necesarios
full_adder_24 full_adder_24_1 (
    .a(address[23:0]),
    .b(24'd1), // Incrementar la dirección en 1 para obtener la siguiente instrucción
    .result(full_adder_24_1_out)
);

full_adder_24 full_adder_24_2 (
    .a(full_adder_24_1_out),
    .b(24'd1), // Incrementar nuevamente para la siguiente instrucción
    .result(full_adder_24_2_out)
);

full_adder_24 full_adder_24_3 (
    .a(full_adder_24_2_out),
    .b(24'd1), // Incrementar nuevamente para la siguiente instrucción
    .result(full_adder_24_3_out)
);

rom_24x8 rom_24x8_1 (
    .addr(address[23:0]),
    .data_out(rom_24x8_1_out)
);

rom_24x8 rom_24x8_2 (
    .addr(full_adder_24_1_out),
    .data_out(rom_24x8_2_out)
);

rom_24x8 rom_24x8_3 (
    .addr(full_adder_24_2_out),
    .data_out(rom_24x8_3_out)
);

rom_24x8 rom_24x8_4 (
    .addr(full_adder_24_3_out),
    .data_out(rom_24x8_4_out)
);

// Combinar las salidas de las ROMs para formar la instrucción final
assign instruction = {rom_24x8_1_out, rom_24x8_2_out, rom_24x8_3_out, rom_24x8_4_out};
endmodule
