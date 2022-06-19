
module pe77(
  input wire clk,
	input wire rst,
input wire en,
// input wire [7:0]cur[8],
  input wire [31:0]in_a,
  input wire [31:0]in_b,
  output reg [31:0]out_a,
  output reg [31:0]out_b,
  output reg [31:0]out_c,
  output reg finish_flag

);
 wire [31:0]tmp;
 reg [6:0]sum_num;
mul32 mul_1(.input1(in_a),.input2(in_b),.o(tmp));

always@(posedge clk or negedge rst)
	if (!rst)
	begin
		out_a<=0;
    out_b<=0;
    out_c<=0;
    sum_num<=0;
    finish_flag<=0;
	end
	else
    begin
if (en)
begin
  if (sum_num<64)begin
      out_a<=in_a;
      out_b<=in_b;
      out_c[31:16]<=out_c[31:16]+tmp[31:16];
      out_c[15:0]<=out_c[15:0]+tmp[15:0];
      sum_num<=sum_num+1;
end
  else begin
    finish_flag<=1;
  end

end

else begin
      out_a<=0;
      out_b<=0;
      out_c<=0;
      sum_num<=0;
      finish_flag<=0;//添加结束标志
end
    end


endmodule