`timescale 1ns/1ps

module xorgate(
    input a,
    input b,
    output y
);

assign y = a ^ b;

endmodule