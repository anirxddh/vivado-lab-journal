`timescale 1ns / 1ps

module demux(
    input d,
    input [1:0] sel,
    output [3:0] y
);

assign y[0] = d & ~sel[1] & ~sel[0];
assign y[1] = d & ~sel[1] & sel[0];
assign y[2] = d & sel[1] & ~sel[0];
assign y[3] = d & sel[1] & sel[0];

endmodule