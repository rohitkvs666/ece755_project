module neuron(in1, in2, in3, in4, w1, w2, w3, w4, out);

    parameter input_size = 5;
    parameter output_size = 10;
    input signed [4:0] w1, w2, w3, w4;
    input signed [input_size - 1: 0] in1, in2, in3, in4;
    output signed [output_size - 1 : 0] out;

    assign out = in1*w1 + in2*w2 + in3*w3 + in4*w4;

endmodule