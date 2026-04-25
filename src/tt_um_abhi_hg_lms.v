module tt_um_abhi_hg_lms (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       clk,
    input  wire       rst_n,
    input  wire       ena
);

    // Map inputs
    wire signed [7:0] x_in = ui_in;
    wire signed [7:0] d_in = uio_in;

    // Internal signals
    wire signed [15:0] y_out;
    wire signed [15:0] e_out;

    // Your design
    hg_lms_top core (
        .clk(clk),
        .rst_n(rst_n),
        .x_in(x_in),
        .d_in(d_in),
        .y_out(y_out),
        .e_out(e_out)
    );

    // Output mapping
    assign uo_out = y_out[15:8];

    // Debug output
    assign uio_out = e_out[15:8];

    // Enable outputs
    assign uio_oe = 8'hFF;

endmodule
