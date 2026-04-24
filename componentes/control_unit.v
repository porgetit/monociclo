module control_unit (
        input wire [31:0] instruction,
        output reg RUWr, ALUASrc, ALUBSrc, DMWr,
        output reg [1:0] RUDataWrSrc,
        output reg [2:0] ImmSrc, DMCtrl,
        output reg [3:0] ALUOp,
        output reg [4:0] BrOp
);

wire [6:0] opcode = instruction[6:0];
wire [2:0] funct3 = instruction[14:12];
wire [6:0] funct7 = instruction[31:25];

endmodule
