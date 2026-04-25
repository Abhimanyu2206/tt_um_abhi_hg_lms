module shift_add_mul_8x16 (
    input  wire [7:0]  a,
    input  wire [15:0] b,
    output wire [23:0] y
);

    assign y =
        ({24{a[0]}} & (b << 0)) +
        ({24{a[1]}} & (b << 1)) +
        ({24{a[2]}} & (b << 2)) +
        ({24{a[3]}} & (b << 3)) +
        ({24{a[4]}} & (b << 4)) +
        ({24{a[5]}} & (b << 5)) +
        ({24{a[6]}} & (b << 6)) +
        ({24{a[7]}} & (b << 7));

endmodule
