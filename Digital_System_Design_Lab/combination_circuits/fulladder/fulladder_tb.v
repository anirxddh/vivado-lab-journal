`timescale 1ns / 1ps

module fulladder_tb;

reg a;
reg b;
reg cin;
wire s;
wire cout;

fulladder uut(
.a(a),
.b(b),
.cin(cin),
.s(s),
.cout(cout)
);

initial begin

$monitor ("input a=%b, b=%b, cin=%b & output s=%b, cout=%b",
          a, b, cin, s, cout);

a = 0; b = 0; cin = 0; #10;
a = 0; b = 0; cin = 1; #10;
a = 0; b = 1; cin = 0; #10;
a = 0; b = 1; cin = 1; #10;
a = 1; b = 0; cin = 0; #10;
a = 1; b = 0; cin = 1; #10;
a = 1; b = 1; cin = 0; #10;
a = 1; b = 1; cin = 1; #10;

#20 $finish;

end

endmodule