module radix4_square_16bit (
    input  wire [15:0] a,
    output wire [31:0] y
);
    wire [7:0] a0 = a[7:0];
    wire [7:0] a1 = a[15:8];

    wire [15:0] p0 = a0 * a0;
    wire [15:0] p1 = a1 * a1;
    wire [15:0] cross = a0 * a1;

    assign y = p0 + (cross << 8) + (p1 << 16);
endmodule
