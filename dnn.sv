module dnn(x0, x1, x2, x3, w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, 
w37, w48, w58, w49, w59, w68, w69, w78, w79, out0, out1, in_ready, out10_ready, out11_ready, clk);

    input signed [4:0] x0, x1, x2, x3, w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, w37, 
    w48, w58, w49, w59, w68, w69, w78, w79;
    input in_ready, clk;

    output reg signed [16:0] out0, out1;
    output reg out10_ready, out11_ready;

    logic signed [10:0] y4, y5, y6, y7, y4_relu_out, y5_relu_out, y6_relu_out, y7_relu_out;
    
    always_ff@(posedge clk) begin
        if(in_ready) begin
            y4 <= x0*w04 + x1*w14 + x2*w24 + x3*w34 ;
            y5 <= x0*w05 + x1*w15 + x2*w25 + x3*w35 ;
            y6 <= x0*w06 + x1*w16 + x2*w26 + x3*w36 ;
            y7 <= x0*w07 + x1*w17 + x2*w27 + x3*w37 ;

            y4_relu_out <= (y4[10]) ? 0 : y4 ;
            y5_relu_out <= (y5[10]) ? 0 : y5 ;
            y6_relu_out <= (y6[10]) ? 0 : y6 ;
            y7_relu_out <= (y7[10]) ? 0 : y7 ;

            out0 <= y4_relu_out*w48 + y5_relu_out*w58 + y6_relu_out*w68 + y7_relu_out*w78;
            out1 <= y4_relu_out*w49 + y5_relu_out*w59 + y6_relu_out*w69 + y7_relu_out*w79;

            out10_ready <= 1'b1;
            out11_ready <= 1'b1;

        end
        else begin
            // need to confirm
            out10_ready <= 1'b0;
            out11_ready <= 1'b0;
        end
    end

endmodule