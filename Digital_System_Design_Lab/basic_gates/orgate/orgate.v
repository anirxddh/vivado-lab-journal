`timescale 1ns\1ps

module orgate(
    input a,
    input b, 
    output y
);

assign y = a | b;

endmodule