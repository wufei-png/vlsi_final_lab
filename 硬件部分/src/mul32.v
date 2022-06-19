`include "./mul16.v"
module mul32
(
    input signed [31 : 0] input1,
    input signed [31 : 0] input2,//有符号数的乘法器
    output signed [31 : 0] o//[63 : 0] o mid 64 
);
wire [15:0]a;
wire [15:0]b;
wire [15:0]c;
wire [15:0]d;
wire [15:0]out1;//[31:0]out1; mid 64
wire [15:0]out2;
wire [15:0]out3;
wire [15:0]out4;
assign a=input1[31:16];
assign b=input1[15:0];
assign c=input2[31:16];
assign d=input2[15:0];
mul16 mul_1(.a(a),.b(c),.o(out1));
mul16 mul_2(.a(b),.b(d),.o(out2));
mul16 mul_3(.a(a),.b(d),.o(out3));
mul16 mul_4(.a(b),.b(c),.o(out4));
assign o = {out1 + out2, out4 - out3};//4个乘两个加  (a+bi)*(c-di)

endmodule