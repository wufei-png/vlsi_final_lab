
`include "./pe.v"
`timescale 1ns/1ps
//格式化代码
module pe_tb;
    reg     clk;
    reg rst;
  reg [31:0]in_a;
  reg [31:0]in_b;
  wire [31:0]out_a;
  wire [31:0]out_b;
  wire [31:0]out_c;
integer index=0;
pe pe_1(.clk(clk),.rst(rst),.in_a(in_a),.in_b(in_b),.out_a(out_a),.out_b(out_b),.out_c(out_c));
    initial begin
      	$display("start a clock pulse");    // 打印开始标记
					$dumpfile("wave.vcd");              // 指定记录模拟波形的文件
					$dumpvars(0, pe_tb);          // 指定记录的模块层级
  rst<=1;
  clk<=0;
 in_a<={7'b0,2'b11,23'b0};
        in_b<={7'b0,2'b11,23'b0};
        //  in_a<={7'b0,1'b1,24'b0};
        // in_b<={7'b0,1'b1,24'b0};
  #1  rst<=0;
  #1  rst<=1;

          // #1data_in_cur0[3:0]<=4'b1;                  // 6000个单位时间后结束模拟
          // #1data_in_cur0[7:4]<=4'b1; 
          #10 $finish;  
    end
    

    always begin
        #2.5 clk = ~clk;                 // 每20个单位clock取反

    end

endmodule