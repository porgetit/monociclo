/*
       Control Unit
       Este módulo implementa la unidad de control para un procesador RISC-V de 32 bits.
       Entradas:
               - instruction: Instrucción de 32 bits que se va a decodificar.
        Salidas:
               - ru_wr: Señal de escritura para el registro de destino.
               - alu_a_src: Selección de la fuente A para la ALU.
               - alu_b_src: Selección de la fuente B para la ALU.
               - dm_wr: Señal de escritura para la memoria de datos.
               - ru_data_wr_src: Selección de la fuente de datos para escribir en el registro.
               - imm_src: Selección del tipo de inmediato a usar.
               - dm_ctrl: Control para la memoria de datos (tipo de acceso).
               - alu_op: Operación a realizar en la ALU.
               - br_op: Operación de rama a realizar.
*/

module control_unit (
        input wire [31:0] instruction,
        output reg ru_wr, alu_a_src, alu_b_src, dm_wr,
        output reg [1:0] ru_data_wr_src,
        output reg [2:0] imm_src, dm_ctrl,
        output reg [3:0] alu_op,
        output reg [4:0] br_op
);

wire [6:0] opcode = instruction[6:0];
wire [4:0] rd = instruction[11:7];
wire [2:0] funct3 = instruction[14:12];
wire [4:0] rs1 = instruction[19:15];
wire [4:0] rs2 = instruction[24:20];
wire [6:0] funct7 = instruction[31:25];

always_comb begin
        ru_wr = 1'b0;
        alu_op = 4'b0000;
        imm_src = 3'b000;
        alu_a_src = 1'b0;
        alu_b_src = 1'b0;
        dm_wr = 1'b0;
        dm_ctrl = 3'b000;
        br_op = 5'b00000;
        ru_data_wr_src = 2'b00;

        case (opcode)

                7'b0110011: begin // FMT R
                        ru_wr = 1'b1;
                        alu_b_src = 1'b0;
                        ru_data_wr_src = 2'b00;
                        alu_op = {funct7[5], funct3};
                end

                7'b0010011: begin // FMT I Aritmetico
                        ru_wr = 1'b1;
                        imm_src = 3'b000;
                        alu_b_src = 1'b1;
                        ru_data_wr_src = 2'b00;
                        alu_op = funct3;
                end

                7'b0000011: begin // FMT I Carga
                        ru_wr = 1'b1;
                        imm_src = 3'b000;
                        alu_op = 4'b0000;
                        alu_b_src = 1'b1;
                        dm_wr = 1'b0;
                        dm_ctrl = funct3;
                        ru_data_wr_src = 2'b01;
                end

                7'b1100011: begin // FMT B
                        ru_wr = 1'b0;
                        alu_op = 4'b0000;
                        imm_src = 3'b101;
                        alu_a_src = 1'b1;
                        alu_b_src = 1'b1;
                        dm_wr = 1'b0;
                        br_op = funct3;
                end

                7'b1101111: begin // FMT J
                        ru_wr = 1'b1;
                        alu_op = 4'b0000;
                        imm_src = 3'b110;
                        alu_a_src = 1'b1;
                        alu_b_src = 1'b1;
                        dm_wr = 1'b0;
                        br_op = 5'b10000;
                        ru_data_wr_src = 2'b10;
                end

                7'b0100011: begin // FMT S
                        ru_wr = 1'b0;
                        alu_op = 4'b0000;
                        imm_src = 3'b001;
                        alu_b_src = 1'b1;
                        dm_wr = 1'b1;
                        dm_ctrl = funct3;
                        dm_ctrl = 5'b00000;
                        ru_data_wr_src = 2'b00;
                end

                7'b1100111: begin // FMT I JALR
                        ru_wr = 1'b1;
                        alu_op = 4'b0000;
                        imm_src = 3'b000;
                        alu_b_src = 1'b1;
                        dm_wr = 1'b0;
                        dm_ctrl = 3'b000;
                        br_op = 5'b10000;
                        ru_data_wr_src = 2'b10;
                end

                7'b0110111: begin // FMT U LUI
                        ru_wr = 1'b0;
                        alu_op = 4'b0111;
                        imm_src = 3'b010;
                        alu_b_src = 1'b1;
                        dm_wr = 1'b0;
                        br_op = 5'b00000;
                        ru_data_wr_src = 2'b00;
                end

                7'b0010111: begin // FMT U AUIPC
                        ru_wr = 1'b0;
                        alu_op = 4'b0111;
                        imm_src = 3'b010;
                        alu_b_src = 1'b1;
                        dm_wr = 1'b0;
                        br_op = 5'b00000;
                        ru_data_wr_src = 2'b00;
                end

                default: begin
                        ru_wr = 1'b0;
                        alu_op = 4'b0000;
                        imm_src = 3'b000;
                        alu_a_src = 1'b0;
                        alu_b_src = 1'b0;
                        dm_wr = 1'b0;
                        dm_ctrl = 3'b000;
                        br_op = 5'b00000;
                        ru_data_wr_src = 2'b00;
                end
        endcase
end
endmodule
