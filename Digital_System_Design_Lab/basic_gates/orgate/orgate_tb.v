`timescale 1ns / 1ps
module orgate_tb;

reg a;
reg b;
wire y;

orgate uut(
.a(a),
.b(b),
.y(y)
);

initial begin
$monitor("a=%b b=%b | y=%b", a, b, y);

a=0; b=0; #10;
a=0; b=1; #10;
a=1; b=0; #10;
a=1; b=1; #10;

#20 $finish;
end

endmodule