`timescale 1ns / 1ps

module demux_tb;

reg d;
reg [1:0] sel;
wire [3:0] y;

demux uut(
    .d(d),
    .sel(sel),
    .y(y)
);

initial begin

$monitor("input d=%b, sel=%b & output y=%b", d, sel, y);

d = 0; sel = 2'b00; #10;
d = 0; sel = 2'b01; #10;
d = 0; sel = 2'b10; #10;
d = 0; sel = 2'b11; #10;

d = 1; sel = 2'b00; #10;
d = 1; sel = 2'b01; #10;
d = 1; sel = 2'b10; #10;
d = 1; sel = 2'b11; #10;

#20 $finish;

end

endmodule