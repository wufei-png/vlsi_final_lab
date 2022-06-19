
`timescale 1ns/1ps
//格式化代码
module test;
    reg     clock;
    reg rst;
    reg [7:0]data_in_cur0;
    reg [15:0]a;
    reg [15:0]b;
    reg [15:0]c;


integer index=0;
    initial begin
      	$display("start a clock pulse");    // 打印开始标记
					$dumpfile("wave.vcd");              // 指定记录模拟波形的文件
					$dumpvars(0, test);          // 指定记录的模块层级
        // a<=16'b 1111110111110111;
        // b=16'b  1111111111011110;
        // #1 c=a+b;
        // #1 c<={4'b0,1'b1};
        $display("%d\n",$signed(16'b));
          // #1data_in_cur0[3:0]<=4'b1;                  // 6000个单位时间后结束模拟
          // #1data_in_cur0[7:4]<=4'b1; 
          #2 $finish;  
    end
    

    always begin
        #2.5 clock = ~clock;                 // 每20个单位clock取反

    end

endmodule