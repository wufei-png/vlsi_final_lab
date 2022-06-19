`include "./mul32.v"
module pe(
  input wire clk,
	input wire rst,
input wire en,
// input wire [7:0]cur[8],
  input wire [31:0]in_a,
  input wire [31:0]in_b,
  output reg [31:0]out_a,
  output reg [31:0]out_b,
  output reg [31:0]out_c
//output reg [63:0]out_c min64
);
 wire [31:0]tmp;
 reg [6:0]sum_num;
 reg zhengshu;
 reg fushu;
//  wire [31:0]in_a_T;
//  assign in_a_T[15:0] = 16'b1111111111111111-in_a[15:0]+1;
// assign in_a_T[31:16] = in_a[31:16];
mul32 mul_1(.input1(in_a),.input2(in_b),.o(tmp));

always@(posedge clk or negedge rst)
	if (!rst)
	begin
		out_a<=0;
    out_b<=0;
    out_c<=0;
    sum_num<=0;
    fushu<=0;
    zhengshu<=0;
	end
	else
    begin
if (en)
begin
  // in_a[15:0]<=16'b1111111111111111-in_a[15:0]+1;
  if (sum_num<=64)begin
      out_a<=in_a;
      out_b<=in_b;

      if(out_c[31]==1&&tmp[31]==1)
      begin
        fushu<=1;
      end
      else begin
        fushu<=0;
      end
      if(out_c[31]==0&&tmp[31]==0)
      begin
        zhengshu<=1;
      end
      else
      begin
        zhengshu<=0;
      end
      out_c[31:16]<=out_c[31:16]+tmp[31:16];//out_c[63:32]<=out_c[63:32]+tmp[63:32]; mid64
      if(fushu==1&&out_c[31]==0)//&&out_c[63]==0
        $display("负数溢出！\n");
      if(zhengshu==1&&out_c[31]==1)
        $display("正数溢出！\n");
      out_c[15:0]<=out_c[15:0]+tmp[15:0];
      sum_num<=sum_num+1;
end
end
else begin
      out_a<=0;
      out_b<=0;
      out_c<=0;
      sum_num<=0;
end
    end

endmodule