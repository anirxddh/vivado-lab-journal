`timescale 1ns/1ps

module xnorgate(
    input a,
    input b,
    output y
);

assign y = ~(a ^ b);

endmodule