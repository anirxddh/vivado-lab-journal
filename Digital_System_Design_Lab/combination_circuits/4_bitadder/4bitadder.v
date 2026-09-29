`timescale 1ns / 1ps

module fourbit_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
);

wire c1, c2, c3;

fulladder fa0(
.a(a[0]),
.b(b[0]),
.cin(cin),
.s(s[0]),
.cout(c1)
);

fulladder fa1(
.a(a[1]),
.b(b[1]),
.cin(c1),
.s(s[1]),
.cout(c2)
);

fulladder fa2(
.a(a[2]),
.b(b[2]),
.cin(c2),
.s(s[2]),
.cout(c3)
);

fulladder fa3(
.a(a[3]),
.b(b[3]),
.cin(c3),
.s(s[3]),
.cout(cout)
);

endmodule