module lms_adaptive_filter (
    input  wire clk,
    input  wire rst_n,

    input  wire signed [7:0] d_in,

    input  wire signed [15:0] xf60,
    input  wire signed [15:0] xf120,
    input  wire signed [15:0] xf180,
    input  wire signed [15:0] xf240,

    output reg  signed [15:0] y_out,
    output reg  signed [15:0] e_out
);

    reg signed [15:0] w0, w1, w2, w3;

    wire signed [31:0] p0 = w0 * xf60;
    wire signed [31:0] p1 = w1 * xf120;
    wire signed [31:0] p2 = w2 * xf180;
    wire signed [31:0] p3 = w3 * xf240;

    wire signed [31:0] y_sum =
          (p0 >>> 7)
        + (p1 >>> 14)
        + (p2 >>> 13)
        + (p3 >>> 13);

    wire signed [15:0] d_q15 = d_in <<< 8;
    wire signed [15:0] e = d_q15 - y_sum[15:0];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            w0 <= 0; w1 <= 0; w2 <= 0; w3 <= 0;
            y_out <= 0;
            e_out <= 0;
        end else begin
            y_out <= y_sum[15:0];
            e_out <= e;

            w0 <= w0 + ((e * xf60)  >>> 21);
            w1 <= w1 + ((e * xf120) >>> 28);
            w2 <= w2 + ((e * xf180) >>> 27);
            w3 <= w3 + ((e * xf240) >>> 27);
        end
    end

endmodule
