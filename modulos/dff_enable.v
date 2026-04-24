/*
    Módulo: dff_enable
    Descripción: Flip-flop D con enable.
    El valor de q se actualiza con d solo cuando en es 1.
    Si en es 0, q mantiene su valor anterior, independientemente de d.
*/

module dff_enable (
    input wire d,
    input wire clk,
    input wire en,
    output wire q
);

// Lógica del flip-flop D con enable
always @(posedge clk) begin // always @(posedge clk) dispara en el flanco positivo del reloj
    if (en) begin
        q <= d; // Si enable 1, se actualiza q con el valor de d
    end
    // Si enable es 0, q mantiene su valor anterior.
end

endmodule
