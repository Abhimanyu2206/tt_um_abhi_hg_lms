module hg_lms_top (
    input  wire clk,
    input  wire rst_n,
    input  wire signed [7:0] x_in,
    input  wire signed [7:0] d_in,

    output wire signed [15:0] y_out,
    output wire signed [15:0] e_out
);

    wire signed [15:0] xf60, xf120, xf180, xf240;

    harmonic_generator hg (
        .clk(clk),
        .rst_n(rst_n),
        .x_in(x_in),
        .xf60(xf60),
        .xf120(xf120),
        .xf180(xf180),
        .xf240(xf240)
    );

    lms_adaptive_filter lms (
        .clk(clk),
        .rst_n(rst_n),
        .d_in(d_in),
        .xf60(xf60),
        .xf120(xf120),
        .xf180(xf180),
        .xf240(xf240),
        .y_out(y_out),
        .e_out(e_out)
    );

endmodule
