module harmonic_generator (
    input  wire clk,
    input  wire rst_n,
    input  wire signed [7:0] x_in,

    output reg signed [15:0] xf60,
    output reg signed [15:0] xf120,
    output reg signed [15:0] xf180,
    output reg signed [15:0] xf240
);

    wire [7:0] x_mag = x_in[7] ? -x_in : x_in;

    wire [15:0] x2;
    wire [23:0] x3_u;
    wire signed [23:0] x3;
    wire [31:0] x4;

    radix4_square_8bit  sq1 (x_mag, x2);
    shift_add_mul_8x16  mul3 (x_mag, x2, x3_u);
    radix4_square_16bit sq2 (x2, x4);

    assign x3 = x_in[7] ? -x3_u : x3_u;

    // XF120
    wire signed [15:0] xf120_w =
        (x2 <<< 1) - 16'sh4000;

    // XF180 using compressor
    wire signed [23:0] x_q = {{16{x_in[7]}}, x_in} <<< 14;

    wire [23:0] sum180, carry180;

    compressor3_2 #(24) comp180 (
        .A(x3 <<< 2),
        .B(~x_q),
        .C(~(x_q <<< 1)),
        .SUM(sum180),
        .CARRY(carry180)
    );

    wire signed [23:0] xf180_full =
        sum180 + (carry180 << 1) + 1;

    // XF240 using compressor
    wire [31:0] sum240, carry240;

    compressor3_2 #(32) comp240 (
        .A(x4 <<< 3),
        .B(~({{8{xf180_full[23]}}, xf180_full} <<< 7)),
        .C(~(32'sd3 <<< 28)),
        .SUM(sum240),
        .CARRY(carry240)
    );

    wire signed [31:0] xf240_full =
        sum240 + (carry240 << 1) + 1;

    // Register outputs
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            xf60  <= 0;
            xf120 <= 0;
            xf180 <= 0;
            xf240 <= 0;
        end else begin
            xf60  <= {{8{x_in[7]}}, x_in};
            xf120 <= xf120_w;
            xf180 <= xf180_full[23:8];
            xf240 <= xf240_full >>> 13;
        end
    end

endmodule
