`timescale 1ns / 1ps

module three_8bitadder_tb;

reg  [7:0] A;
reg  [7:0] B;
reg  [7:0] C;
wire [9:0] SUM;

three_8bitadder uut (
    .A(A),
    .B(B),
    .C(C),
    .SUM(SUM)
);

initial begin

    // Test Case 1
    A = 8'd10;
    B = 8'd20;
    C = 8'd30;
    #10;

    // Test Case 2
    A = 8'd50;
    B = 8'd25;
    C = 8'd15;
    #10;

    // Test Case 3
    A = 8'd100;
    B = 8'd50;
    C = 8'd25;
    #10;

    // Test Case 4 (Max case of (2^N-1))
    A = 8'd255;
    B = 8'd255;
    C = 8'd255;
    #10;

    $stop;

end

endmodule