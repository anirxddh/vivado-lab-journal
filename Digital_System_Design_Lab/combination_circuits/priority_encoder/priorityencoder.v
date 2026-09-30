`timescale 1ns / 1ps

module priorityencoder(
    input [3:0] d,
    output [1:0] y,
    output valid
);

assign y[1] = d[3] | d[2];
assign y[0] = d[3] | (~d[2] & d[1]);
assign valid = d[3] | d[2] | d[1] | d[0];

endmodule