module compressor3_2 #(parameter N = 32)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire [N-1:0] C,
    output wire [N-1:0] SUM,
    output wire [N-1:0] CARRY
);

    assign SUM   = A ^ B ^ C;
    assign CARRY = (A & B) | (B & C) | (A & C);

endmodule
