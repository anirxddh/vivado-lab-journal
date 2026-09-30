`timescale 1ns / 1ps

module alu1bit(
    input a,
    input b,
    input cin,
    input [1:0] sel,
    output reg y,
    output reg cout
);

always @(*) begin

    cout = 0;

    case(sel)

        2'b00: begin
            y = a & b;
        end

        2'b01: begin
            y = a | b;
        end

        2'b10: begin
            y = a ^ b ^ cin;
            cout = (a & b) | (b & cin) | (a & cin);
        end

        2'b11: begin
            y = a ^ b;
        end

    endcase

end

endmodule