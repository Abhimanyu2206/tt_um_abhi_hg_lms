module radix4_square_8bit (
    input  wire [7:0] a,
    output wire [15:0] y
);
    wire [3:0] a0 = a[3:0];
    wire [3:0] a1 = a[7:4];

    wire [7:0] p0 = a0 * a0;
    wire [7:0] p1 = a1 * a1;
    wire [7:0] cross = a0 * a1;

    assign y = p0 + (cross << 4) + (p1 << 8);
endmodule
