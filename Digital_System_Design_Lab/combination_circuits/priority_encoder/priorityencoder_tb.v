`timescale 1ns / 1ps

module priorityencoder_tb;

reg [3:0] d;
wire [1:0] y;
wire valid;

priorityencoder uut(
    .d(d),
    .y(y),
    .valid(valid)
);

initial begin

$monitor("input d=%b & output y=%b, valid=%b", d, y, valid);

d = 4'b0000; #10;
d = 4'b0001; #10;
d = 4'b0010; #10;
d = 4'b0011; #10;
d = 4'b0100; #10;
d = 4'b0101; #10;
d = 4'b0111; #10;
d = 4'b1000; #10;
d = 4'b1010; #10;
d = 4'b1111; #10;

#20 $finish;

end

endmodule