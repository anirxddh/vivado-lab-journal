`timescale 1ns / 1ps

module alu1bit_tb;

reg a;
reg b;
reg cin;
reg [1:0] sel;

wire y;
wire cout;

alu1bit uut(
    .a(a),
    .b(b),
    .cin(cin),
    .sel(sel),
    .y(y),
    .cout(cout)
);

initial begin

$monitor("a=%b, b=%b, cin=%b, sel=%b & y=%b, cout=%b",
         a, b, cin, sel, y, cout);

/* AND */
a = 0; b = 0; cin = 0; sel = 2'b00; #10;
a = 0; b = 1; cin = 0; sel = 2'b00; #10;
a = 1; b = 1; cin = 0; sel = 2'b00; #10;

/* OR */
a = 0; b = 1; cin = 0; sel = 2'b01; #10;
a = 1; b = 0; cin = 0; sel = 2'b01; #10;
a = 1; b = 1; cin = 0; sel = 2'b01; #10;

/* ADD */
a = 0; b = 0; cin = 0; sel = 2'b10; #10;
a = 0; b = 1; cin = 0; sel = 2'b10; #10;
a = 1; b = 1; cin = 0; sel = 2'b10; #10;
a = 1; b = 1; cin = 1; sel = 2'b10; #10;

/* XOR */
a = 0; b = 0; cin = 0; sel = 2'b11; #10;
a = 0; b = 1; cin = 0; sel = 2'b11; #10;
a = 1; b = 0; cin = 0; sel = 2'b11; #10;
a = 1; b = 1; cin = 0; sel = 2'b11; #10;

#20 $finish;

end

endmodule