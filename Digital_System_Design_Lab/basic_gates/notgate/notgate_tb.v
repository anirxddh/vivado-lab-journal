`timescale 1ns/1ps

module notgate_tb;

reg a;
wire y;

notgate uut(  // unit under testing
.a(a),
.y(y)
);

initial begin

$monitor ("input a=%b & output y = %b", a, y);

a = 0; #10;
a = 1; #10;
#20 $finish;

end

endmodule