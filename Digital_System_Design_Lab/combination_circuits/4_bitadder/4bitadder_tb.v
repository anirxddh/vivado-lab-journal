`timescale 1ns / 1ps

module fourbit_adder_tb;

reg [3:0] a;
reg [3:0] b;
reg cin;

wire [3:0] s;
wire cout;

fourbit_adder uut(
.a(a),
.b(b),
.cin(cin),
.s(s),
.cout(cout)
);

initial begin

$monitor ("a=%b, b=%b, cin=%b & s=%b, cout=%b",
          a, b, cin, s, cout);

a = 4'b0000; b = 4'b0000; cin = 0; #10;
a = 4'b0001; b = 4'b0010; cin = 0; #10;
a = 4'b0101; b = 4'b0011; cin = 0; #10;
a = 4'b1111; b = 4'b0001; cin = 0; #10;
a = 4'b1010; b = 4'b0101; cin = 0; #10;
a = 4'b1111; b = 4'b1111; cin = 0; #10;
a = 4'b0011; b = 4'b0100; cin = 1; #10;

#20 $finish;

end

endmodule