/*
    Módulo: dff_enable_32
    Descripción: Flip-flop D con enable de 32 bits.
    Entradas:
        - d: Entrada de datos de 32 bits.
        - clk: Señal de reloj.
        - en: Señal de enable.
        - reset: Señal de reinicio.
    Salidas:
        - q: Salida de datos de 32 bits.

*/

module dff_enable_32 (
    input wire [31:0] d,
    input wire clk,
    input wire en,
    output wire [31:0] q
);

always @(posedge clk) begin
    if (reset) begin
        q <= 32'b0; // Reiniciar a cero
    end else if (en) begin
        q <= d; // Asignación no-bloqueante para todos los bits
    end
end
endmodule

