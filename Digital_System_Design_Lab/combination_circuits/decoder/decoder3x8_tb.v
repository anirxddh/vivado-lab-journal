`timescale 1ns / 1ps

module decoder3x8_tb;

reg [2:0] a;
wire [7:0] y;

decoder3x8 uut(
    .a(a),
    .y(y)
);

initial begin

$monitor("input a=%b & output y=%b", a, y);

a = 3'b000; #10;
a = 3'b001; #10;
a = 3'b010; #10;
a = 3'b011; #10;
a = 3'b100; #10;
a = 3'b101; #10;
a = 3'b110; #10;
a = 3'b111; #10;

#20 $finish;

end

endmodule