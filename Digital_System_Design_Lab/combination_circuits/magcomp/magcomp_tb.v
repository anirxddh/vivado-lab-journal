`timescale 1ns / 1ps

module magcomp_tb;

reg a;
reg b;

wire greater;
wire equal;
wire less;

magcomp uut(
.a(a),
.b(b),
.greater(greater),
.equal(equal),
.less(less)
);

initial begin

$monitor ("input a=%b, b=%b & a>b=%b, a=b=%b, a<b=%b",
          a, b, greater, equal, less);

a = 0; b = 0; #10;
a = 0; b = 1; #10;
a = 1; b = 0; #10;
a = 1; b = 1; #10;

#20 $finish;

end

endmodule