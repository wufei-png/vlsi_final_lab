module mul16
(
    input signed [15 : 0] a,
    input signed [15 : 0] b,//有符号数的乘法器
    output signed [15 : 0] o //[31 : 0] o mid64
);
 wire signed [31 : 0] long;
    assign long = a * b;//32位乘以32位为64位
    assign o = long >>> 8;//右移8位并把它赋值给32位的o，代表舍弃16位小数中的低8位，而16位整数中的高16位看数据全为0，因此也舍弃，因为结果数据应该是32位的
    //注意，这里直接修改8这个数即可实现输入和输出的整数小数的比例
    //assign o = long mid64
endmodule