module dnn(x0, x1, x2, x3, w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, 
w37, w48, w58, w49, w59, w68, w69, w78, w79, out0, out1, in_ready, out10_ready, out11_ready, clk);

    input signed [4:0] x0, x1, x2, x3, w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, w37, 
    w48, w58, w49, w59, w68, w69, w78, w79;
    input in_ready, clk;

    output reg signed [16:0] out0, out1;
    output reg out10_ready, out11_ready;

    logic signed [9:0] y4, y5, y6, y7, y4_relu_out, y5_relu_out, y6_relu_out, y7_relu_out;
    logic signed [4:0] y0, y1, y2, y3;

    neuron #(.input_size(5), .output_size(5)) n0(.in1(x0), .in2(5'h0), .in3(5'h0), .in4(5'h0), .w1(5'h1), .w2(5'h1), .w3(5'h1), .w4(5'h1), .out(y0));
    neuron #(.input_size(5), .output_size(5)) n1(.in1(5'h0), .in2(x1), .in3(5'h0), .in4(5'h0), .w1(5'h1), .w2(5'h1), .w3(5'h1), .w4(5'h1), .out(y1));
    neuron #(.input_size(5), .output_size(5)) n2(.in1(5'h0), .in2(5'h0), .in3(x2), .in4(5'h0), .w1(5'h1), .w2(5'h1), .w3(5'h1), .w4(5'h1), .out(y2));
    neuron #(.input_size(5), .output_size(5)) n3(.in1(5'h0), .in2(5'h0), .in3(5'h0), .in4(x3), .w1(5'h1), .w2(5'h1), .w3(5'h1), .w4(5'h1), .out(y3));
    neuron #(.input_size(5), .output_size(10)) n4(.in1(y0), .in2(y1), .in3(y2), .in4(y3), .w1(w04), .w2(w14), .w3(w24), .w4(w34), .out(y4));
    neuron #(.input_size(5), .output_size(10)) n5(.in1(y0), .in2(y1), .in3(y2), .in4(y3), .w1(w05), .w2(w15), .w3(w25), .w4(w35), .out(y5));
    neuron #(.input_size(5), .output_size(10)) n6(.in1(y0), .in2(y1), .in3(y2), .in4(y3), .w1(w06), .w2(w16), .w3(w26), .w4(w36), .out(y6));
    neuron #(.input_size(5), .output_size(10)) n7(.in1(y0), .in2(y1), .in3(y2), .in4(y3), .w1(w07), .w2(w17), .w3(w27), .w4(w37), .out(y7));
    neuron #(.input_size(10), .output_size(17)) n8(.in1(y4_relu_out), .in2(y5_relu_out), .in3(y6_relu_out), .in4(y7_relu_out), .w1(w48), .w2(w58), .w3(w68), .w4(w78), .out(out0));
    neuron #(.input_size(10), .output_size(17)) n9(.in1(y4_relu_out), .in2(y5_relu_out), .in3(y6_relu_out), .in4(y7_relu_out), .w1(w49), .w2(w59), .w3(w69), .w4(w79), .out(out1));


    always_ff@(posedge clk) begin
        if(in_ready) begin

            y4_relu_out <= (y4[9]) ? 0 : y4 ;
            y5_relu_out <= (y5[9]) ? 0 : y5 ;
            y6_relu_out <= (y6[9]) ? 0 : y6 ;
            y7_relu_out <= (y7[9]) ? 0 : y7 ;

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