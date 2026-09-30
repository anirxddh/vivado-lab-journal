`timescale 1ns / 1ps

module mux8x1(
    input [7:0] d,
    input [2:0] sel,
    output wire y
);

assign y = d[sel];

endmodule