`timescale 1ns / 1ps

module three_8bitadder(
    input  [7:0] A,
    input  [7:0] B,
    input  [7:0] C,
    output [9:0] SUM
);

assign SUM = A + B + C;

endmodule