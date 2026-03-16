`timescale 1ns / 1ps
module halfadder_tb;
reg a;
reg b;
wire s;
wire cout;

halfadder uut(
.a(a),
.b(b),
.s(s),
.cout(cout)
);

initial begin
$monitor ("input a=%b, b=%b & output s = %b, cout = %b", a, b, s, cout);

a = 0; b = 0; #10;
a = 0; b = 1; #10;
a = 1; b = 0; #10;
a = 1; b = 1; #10;
#20 $finish;

end
endmodule