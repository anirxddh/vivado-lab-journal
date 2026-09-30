`timescale 1ns / 1ps

module mux8x1_tb;

reg [7:0] d;
reg [2:0] sel;
wire y;

mux8x1 uut(
.d(d),
.sel(sel),
.y(y)
);

initial begin

$monitor ("d=%b, sel=%b & output y=%b", d, sel, y);

d = 8'b10101010;

sel = 3'b000; #10;
sel = 3'b001; #10;
sel = 3'b010; #10;
sel = 3'b011; #10;
sel = 3'b100; #10;
sel = 3'b101; #10;
sel = 3'b110; #10;
sel = 3'b111; #10;

#20 $finish;

end

endmodule