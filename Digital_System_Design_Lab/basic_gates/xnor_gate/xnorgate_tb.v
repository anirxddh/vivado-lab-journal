`timescale 1ns/1ps

module xnorgate_tb;

reg a;
reg b;
wire y;

xnorgate uut(  // unit under testing
.a(a),
.b(b),
.y(y)
);

initial begin

$monitor ("input a=%b, b=%b & output y = %b", a, b, y);

a = 0; b = 0; #10;
a = 0; b = 1; #10;
a = 1; b = 0; #10;
a = 1; b = 1; #10;
#20 $finish;

end

endmodule