`timescale 1ns/1ps

module notgate(
    input a,
    output y
);

assign y = ~a;

endmodule