/*
    ROM 24x8 bits
    Una memoria de solo lectura (ROM) con 24 bits de dirección y 8 bits de datos.
    Entradas:
        - addr: dirección de 24 bits para acceder a la ROM
    Salidas:
        - data_out: datos de 8 bits leídos desde la ROM
*/

module rom_24x8 (
    input wire [23:0] addr,
    output wire [7:0] data_out
);

reg [7:0] memory [16777216]; // 16M x 8 bits

initial begin
    // cargar la ROM con los datos deseados
    $readmemh("rom_data.hex", memory);
end

assign data_out = memory[addr];
endmodule
