`include "./pe.v"
`include "./pe_77.v"
`include "./delay.v"
  module pe_array(  
    input wire clk,
  input wire rst,
  input wire en,//testbench
  input wire [31:0]input_a_0,input wire [31:0]input_a_1,input wire [31:0]input_a_2,input wire [31:0]input_a_3,input wire [31:0]input_a_4,input wire [31:0]input_a_5,input wire [31:0]input_a_6,input wire [31:0]input_a_7,
    // input wire [31:0]input_b_0,input wire [31:0]input_b_1,input wire [31:0]input_b_2,input wire [31:0]input_b_3,input wire [31:0]input_b_4,input wire [31:0]input_b_5,input wire [31:0]input_b_6,input wire [31:0]input_b_7,

output reg finish_flag
  );
  wire en0;//开启pe计算，不同斜行的数据开启时间不同，需要delay.v进行delay
  wire en1;
  wire en2;
  wire en3;  
  wire en4;
  wire en5;
  wire en6;
  wire en7;
  wire en8;
  wire en9;
  wire en10;
  wire en11;
  wire en12;
  wire en13;
  wire en14;
    reg [31:0]reg_c_00;reg [31:0]reg_c_01;reg [31:0]reg_c_02;reg [31:0]reg_c_03;reg [31:0]reg_c_04;reg [31:0]reg_c_05;reg [31:0]reg_c_06;reg [31:0]reg_c_07;
reg [31:0]reg_c_10;reg [31:0]reg_c_11;reg [31:0]reg_c_12;reg [31:0]reg_c_13;reg [31:0]reg_c_14;reg [31:0]reg_c_15;reg [31:0]reg_c_16;reg [31:0]reg_c_17;
reg [31:0]reg_c_20;reg [31:0]reg_c_21;reg [31:0]reg_c_22;reg [31:0]reg_c_23;reg [31:0]reg_c_24;reg [31:0]reg_c_25;reg [31:0]reg_c_26;reg [31:0]reg_c_27;
reg [31:0]reg_c_30;reg [31:0]reg_c_31;reg [31:0]reg_c_32;reg [31:0]reg_c_33;reg [31:0]reg_c_34;reg [31:0]reg_c_35;reg [31:0]reg_c_36;reg [31:0]reg_c_37;
reg [31:0]reg_c_40;reg [31:0]reg_c_41;reg [31:0]reg_c_42;reg [31:0]reg_c_43;reg [31:0]reg_c_44;reg [31:0]reg_c_45;reg [31:0]reg_c_46;reg [31:0]reg_c_47;
reg [31:0]reg_c_50;reg [31:0]reg_c_51;reg [31:0]reg_c_52;reg [31:0]reg_c_53;reg [31:0]reg_c_54;reg [31:0]reg_c_55;reg [31:0]reg_c_56;reg [31:0]reg_c_57;
reg [31:0]reg_c_60;reg [31:0]reg_c_61;reg [31:0]reg_c_62;reg [31:0]reg_c_63;reg [31:0]reg_c_64;reg [31:0]reg_c_65;reg [31:0]reg_c_66;reg [31:0]reg_c_67;
reg [31:0]reg_c_70;reg [31:0]reg_c_71;reg [31:0]reg_c_72;reg [31:0]reg_c_73;reg [31:0]reg_c_74;reg [31:0]reg_c_75;reg [31:0]reg_c_76;reg [31:0]reg_c_77;
  reg [31:0]reg_a_0;reg [31:0]reg_a_1;reg [31:0]reg_a_2;reg [31:0]reg_a_3;reg [31:0]reg_a_4;reg [31:0]reg_a_5;reg [31:0]reg_a_6;reg [31:0]reg_a_7;
    // reg [31:0]reg_b_0;reg [31:0]reg_b_1;reg [31:0]reg_b_2;reg [31:0]reg_b_3;reg [31:0]reg_b_4;reg [31:0]reg_b_5;reg [31:0]reg_b_6;reg [31:0]reg_b_7;

wire [31:0]a_00;wire [31:0]a_01;wire [31:0]a_02;wire [31:0]a_03;wire [31:0]a_04;wire [31:0]a_05;wire [31:0]a_06;wire [31:0]a_07;
wire [31:0]a_10;wire [31:0]a_11;wire [31:0]a_12;wire [31:0]a_13;wire [31:0]a_14;wire [31:0]a_15;wire [31:0]a_16;wire [31:0]a_17;
wire [31:0]a_20;wire [31:0]a_21;wire [31:0]a_22;wire [31:0]a_23;wire [31:0]a_24;wire [31:0]a_25;wire [31:0]a_26;wire [31:0]a_27;
wire [31:0]a_30;wire [31:0]a_31;wire [31:0]a_32;wire [31:0]a_33;wire [31:0]a_34;wire [31:0]a_35;wire [31:0]a_36;wire [31:0]a_37;
wire [31:0]a_40;wire [31:0]a_41;wire [31:0]a_42;wire [31:0]a_43;wire [31:0]a_44;wire [31:0]a_45;wire [31:0]a_46;wire [31:0]a_47;
wire [31:0]a_50;wire [31:0]a_51;wire [31:0]a_52;wire [31:0]a_53;wire [31:0]a_54;wire [31:0]a_55;wire [31:0]a_56;wire [31:0]a_57;
wire [31:0]a_60;wire [31:0]a_61;wire [31:0]a_62;wire [31:0]a_63;wire [31:0]a_64;wire [31:0]a_65;wire [31:0]a_66;wire [31:0]a_67;
wire [31:0]a_70;wire [31:0]a_71;wire [31:0]a_72;wire [31:0]a_73;wire [31:0]a_74;wire [31:0]a_75;wire [31:0]a_76;wire [31:0]a_77;

wire [31:0]b_00;wire [31:0]b_01;wire [31:0]b_02;wire [31:0]b_03;wire [31:0]b_04;wire [31:0]b_05;wire [31:0]b_06;wire [31:0]b_07;
wire [31:0]b_10;wire [31:0]b_11;wire [31:0]b_12;wire [31:0]b_13;wire [31:0]b_14;wire [31:0]b_15;wire [31:0]b_16;wire [31:0]b_17;
wire [31:0]b_20;wire [31:0]b_21;wire [31:0]b_22;wire [31:0]b_23;wire [31:0]b_24;wire [31:0]b_25;wire [31:0]b_26;wire [31:0]b_27;
wire [31:0]b_30;wire [31:0]b_31;wire [31:0]b_32;wire [31:0]b_33;wire [31:0]b_34;wire [31:0]b_35;wire [31:0]b_36;wire [31:0]b_37;
wire [31:0]b_40;wire [31:0]b_41;wire [31:0]b_42;wire [31:0]b_43;wire [31:0]b_44;wire [31:0]b_45;wire [31:0]b_46;wire [31:0]b_47;
wire [31:0]b_50;wire [31:0]b_51;wire [31:0]b_52;wire [31:0]b_53;wire [31:0]b_54;wire [31:0]b_55;wire [31:0]b_56;wire [31:0]b_57;
wire [31:0]b_60;wire [31:0]b_61;wire [31:0]b_62;wire [31:0]b_63;wire [31:0]b_64;wire [31:0]b_65;wire [31:0]b_66;wire [31:0]b_67;
wire [31:0]b_70;wire [31:0]b_71;wire [31:0]b_72;wire [31:0]b_73;wire [31:0]b_74;wire [31:0]b_75;wire [31:0]b_76;wire [31:0]b_77;

wire [31:0]c_00;wire [31:0]c_01;wire [31:0]c_02;wire [31:0]c_03;wire [31:0]c_04;wire [31:0]c_05;wire [31:0]c_06;wire [31:0]c_07;
wire [31:0]c_10;wire [31:0]c_11;wire [31:0]c_12;wire [31:0]c_13;wire [31:0]c_14;wire [31:0]c_15;wire [31:0]c_16;wire [31:0]c_17;
wire [31:0]c_20;wire [31:0]c_21;wire [31:0]c_22;wire [31:0]c_23;wire [31:0]c_24;wire [31:0]c_25;wire [31:0]c_26;wire [31:0]c_27;
wire [31:0]c_30;wire [31:0]c_31;wire [31:0]c_32;wire [31:0]c_33;wire [31:0]c_34;wire [31:0]c_35;wire [31:0]c_36;wire [31:0]c_37;
wire [31:0]c_40;wire [31:0]c_41;wire [31:0]c_42;wire [31:0]c_43;wire [31:0]c_44;wire [31:0]c_45;wire [31:0]c_46;wire [31:0]c_47;
wire [31:0]c_50;wire [31:0]c_51;wire [31:0]c_52;wire [31:0]c_53;wire [31:0]c_54;wire [31:0]c_55;wire [31:0]c_56;wire [31:0]c_57;
wire [31:0]c_60;wire [31:0]c_61;wire [31:0]c_62;wire [31:0]c_63;wire [31:0]c_64;wire [31:0]c_65;wire [31:0]c_66;wire [31:0]c_67;
wire [31:0]c_70;wire [31:0]c_71;wire [31:0]c_72;wire [31:0]c_73;wire [31:0]c_74;wire [31:0]c_75;wire [31:0]c_76;wire [31:0]c_77;//wire [63:0]c_77; ,mid64

wire finish_flag_wire;
always@(posedge clk or negedge rst)
	if (!rst)
	begin
    finish_flag<=0;
//input
  reg_a_0<=0;reg_a_1<=0;reg_a_2<=0;reg_a_3<=0;reg_a_4<=0;reg_a_5<=0;reg_a_6<=0;reg_a_7<=0;
    // reg_b_0<=0;reg_b_1<=0;reg_b_2<=0;reg_b_3<=0;reg_b_4<=0;reg_b_5<=0;reg_b_6<=0;reg_b_7<=0;

//output
reg_c_00<=0;reg_c_01<=0;reg_c_02<=0;reg_c_03<=0;reg_c_04<=0;reg_c_05<=0;reg_c_06<=0;reg_c_07<=0;
reg_c_10<=0;reg_c_11<=0;reg_c_12<=0;reg_c_13<=0;reg_c_14<=0;reg_c_15<=0;reg_c_16<=0;reg_c_17<=0;
reg_c_20<=0;reg_c_21<=0;reg_c_22<=0;reg_c_23<=0;reg_c_24<=0;reg_c_25<=0;reg_c_26<=0;reg_c_27<=0;
reg_c_30<=0;reg_c_31<=0;reg_c_32<=0;reg_c_33<=0;reg_c_34<=0;reg_c_35<=0;reg_c_36<=0;reg_c_37<=0;
reg_c_40<=0;reg_c_41<=0;reg_c_42<=0;reg_c_43<=0;reg_c_44<=0;reg_c_45<=0;reg_c_46<=0;reg_c_47<=0;
reg_c_50<=0;reg_c_51<=0;reg_c_52<=0;reg_c_53<=0;reg_c_54<=0;reg_c_55<=0;reg_c_56<=0;reg_c_57<=0;
reg_c_60<=0;reg_c_61<=0;reg_c_62<=0;reg_c_63<=0;reg_c_64<=0;reg_c_65<=0;reg_c_66<=0;reg_c_67<=0;
reg_c_70<=0;reg_c_71<=0;reg_c_72<=0;reg_c_73<=0;reg_c_74<=0;reg_c_75<=0;reg_c_76<=0;reg_c_77<=0;

	end
	else
    begin
finish_flag<=finish_flag_wire;
//input
  reg_a_0<=input_a_0;reg_a_1<=input_a_1;reg_a_2<=input_a_2;reg_a_3<=input_a_3;reg_a_4<=input_a_4;reg_a_5<=input_a_5;reg_a_6<=input_a_6;reg_a_7<=input_a_7;
    // reg_b_0<=input_b_0;reg_b_1<=input_b_1;reg_b_2<=input_b_2;reg_b_3<=input_b_3;reg_b_4<=input_b_4;reg_b_5<=input_b_5;reg_b_6<=input_b_6;reg_b_7<=0;

//output
if(finish_flag_wire==1) begin
reg_c_00<=c_00;reg_c_01<=c_01;reg_c_02<=c_02;reg_c_03<=c_03;reg_c_04<=c_04;reg_c_05<=c_05;reg_c_06<=c_06;reg_c_07<=c_07;
reg_c_10<=c_10;reg_c_11<=c_11;reg_c_12<=c_12;reg_c_13<=c_13;reg_c_14<=c_14;reg_c_15<=c_15;reg_c_16<=c_16;reg_c_17<=c_17;
reg_c_20<=c_20;reg_c_21<=c_21;reg_c_22<=c_22;reg_c_23<=c_23;reg_c_24<=c_24;reg_c_25<=c_25;reg_c_26<=c_26;reg_c_27<=c_27;
reg_c_30<=c_30;reg_c_31<=c_31;reg_c_32<=c_32;reg_c_33<=c_33;reg_c_34<=c_34;reg_c_35<=c_35;reg_c_36<=c_36;reg_c_37<=c_37;
reg_c_40<=c_40;reg_c_41<=c_41;reg_c_42<=c_42;reg_c_43<=c_43;reg_c_44<=c_44;reg_c_45<=c_45;reg_c_46<=c_46;reg_c_47<=c_47;
reg_c_50<=c_50;reg_c_51<=c_51;reg_c_52<=c_52;reg_c_53<=c_53;reg_c_54<=c_54;reg_c_55<=c_55;reg_c_56<=c_56;reg_c_57<=c_57;
reg_c_60<=c_60;reg_c_61<=c_61;reg_c_62<=c_62;reg_c_63<=c_63;reg_c_64<=c_64;reg_c_65<=c_65;reg_c_66<=c_66;reg_c_67<=c_67;
reg_c_70<=c_70;reg_c_71<=c_71;reg_c_72<=c_72;reg_c_73<=c_73;reg_c_74<=c_74;reg_c_75<=c_75;reg_c_76<=c_76;reg_c_77<=c_77;
end
    end

delay delay(.clk(clk),.rst(rst),.en(en),.en0(en0),.en1(en1),.en2(en2),.en3(en3),.en4(en4),.en5(en5),.en6(en6),.en7(en7),.en8(en8),.en9(en9),.en10(en10),.en11(en11),.en12(en12),.en13(en13),.en14(en14));
//脉动阵列链接，参考https://mbb.eet-china.com/blog/442508-359170.html
pe pe_00(.clk(clk),.rst(rst),.en(en0),.in_a(reg_a_0),.in_b(reg_a_0),.out_a(a_00),.out_b(b_00),.out_c(c_00));
pe pe_01(.clk(clk),.rst(rst),.en(en1),.in_a(a_00),.in_b(reg_a_1),.out_a(a_01),.out_b(b_01),.out_c(c_01));
pe pe_02(.clk(clk),.rst(rst),.en(en2),.in_a(a_01),.in_b(reg_a_2),.out_a(a_02),.out_b(b_02),.out_c(c_02));
pe pe_03(.clk(clk),.rst(rst),.en(en3),.in_a(a_02),.in_b(reg_a_3),.out_a(a_03),.out_b(b_03),.out_c(c_03));
pe pe_04(.clk(clk),.rst(rst),.en(en4),.in_a(a_03),.in_b(reg_a_4),.out_a(a_04),.out_b(b_04),.out_c(c_04));
pe pe_05(.clk(clk),.rst(rst),.en(en5),.in_a(a_04),.in_b(reg_a_5),.out_a(a_05),.out_b(b_05),.out_c(c_05));
pe pe_06(.clk(clk),.rst(rst),.en(en6),.in_a(a_05),.in_b(reg_a_6),.out_a(a_06),.out_b(b_06),.out_c(c_06));
pe pe_07(.clk(clk),.rst(rst),.en(en7),.in_a(a_06),.in_b(reg_a_7),.out_a(a_07),.out_b(b_07),.out_c(c_07));

pe pe_10(.clk(clk),.rst(rst),.en(en1),.in_a(reg_a_1),.in_b(b_00),.out_a(a_10),.out_b(b_10),.out_c(c_10));
pe pe_11(.clk(clk),.rst(rst),.en(en2),.in_a(a_10),.in_b(b_01),.out_a(a_11),.out_b(b_11),.out_c(c_11));
pe pe_12(.clk(clk),.rst(rst),.en(en3),.in_a(a_11),.in_b(b_02),.out_a(a_12),.out_b(b_12),.out_c(c_12));
pe pe_13(.clk(clk),.rst(rst),.en(en4),.in_a(a_12),.in_b(b_03),.out_a(a_13),.out_b(b_13),.out_c(c_13));
pe pe_14(.clk(clk),.rst(rst),.en(en5),.in_a(a_13),.in_b(b_04),.out_a(a_14),.out_b(b_14),.out_c(c_14));
pe pe_15(.clk(clk),.rst(rst),.en(en6),.in_a(a_14),.in_b(b_05),.out_a(a_15),.out_b(b_15),.out_c(c_15));
pe pe_16(.clk(clk),.rst(rst),.en(en7),.in_a(a_15),.in_b(b_06),.out_a(a_16),.out_b(b_16),.out_c(c_16));
pe pe_17(.clk(clk),.rst(rst),.en(en8),.in_a(a_16),.in_b(b_07),.out_a(a_17),.out_b(b_17),.out_c(c_17));

pe pe_20(.clk(clk),.rst(rst),.en(en2),.in_a(reg_a_2),.in_b(b_10),.out_a(a_20),.out_b(b_20),.out_c(c_20));
pe pe_21(.clk(clk),.rst(rst),.en(en3),.in_a(a_20),.in_b(b_11),.out_a(a_21),.out_b(b_21),.out_c(c_21));
pe pe_22(.clk(clk),.rst(rst),.en(en4),.in_a(a_21),.in_b(b_12),.out_a(a_22),.out_b(b_22),.out_c(c_22));
pe pe_23(.clk(clk),.rst(rst),.en(en5),.in_a(a_22),.in_b(b_13),.out_a(a_23),.out_b(b_23),.out_c(c_23));
pe pe_24(.clk(clk),.rst(rst),.en(en6),.in_a(a_23),.in_b(b_14),.out_a(a_24),.out_b(b_24),.out_c(c_24));
pe pe_25(.clk(clk),.rst(rst),.en(en7),.in_a(a_24),.in_b(b_15),.out_a(a_25),.out_b(b_25),.out_c(c_25));
pe pe_26(.clk(clk),.rst(rst),.en(en8),.in_a(a_25),.in_b(b_16),.out_a(a_26),.out_b(b_26),.out_c(c_26));
pe pe_27(.clk(clk),.rst(rst),.en(en9),.in_a(a_26),.in_b(b_17),.out_a(a_27),.out_b(b_27),.out_c(c_27));

pe pe_30(.clk(clk),.rst(rst),.en(en3),.in_a(reg_a_3),.in_b(b_20),.out_a(a_30),.out_b(b_30),.out_c(c_30));
pe pe_31(.clk(clk),.rst(rst),.en(en4),.in_a(a_30),.in_b(b_21),.out_a(a_31),.out_b(b_31),.out_c(c_31));
pe pe_32(.clk(clk),.rst(rst),.en(en5),.in_a(a_31),.in_b(b_22),.out_a(a_32),.out_b(b_32),.out_c(c_32));
pe pe_33(.clk(clk),.rst(rst),.en(en6),.in_a(a_32),.in_b(b_23),.out_a(a_33),.out_b(b_33),.out_c(c_33));
pe pe_34(.clk(clk),.rst(rst),.en(en7),.in_a(a_33),.in_b(b_24),.out_a(a_34),.out_b(b_34),.out_c(c_34));
pe pe_35(.clk(clk),.rst(rst),.en(en8),.in_a(a_34),.in_b(b_25),.out_a(a_35),.out_b(b_35),.out_c(c_35));
pe pe_36(.clk(clk),.rst(rst),.en(en9),.in_a(a_35),.in_b(b_26),.out_a(a_36),.out_b(b_36),.out_c(c_36));
pe pe_37(.clk(clk),.rst(rst),.en(en10),.in_a(a_36),.in_b(b_27),.out_a(a_37),.out_b(b_37),.out_c(c_37));

pe pe_40(.clk(clk),.rst(rst),.en(en4),.in_a(reg_a_4),.in_b(b_30),.out_a(a_40),.out_b(b_40),.out_c(c_40));
pe pe_41(.clk(clk),.rst(rst),.en(en5),.in_a(a_40),.in_b(b_31),.out_a(a_41),.out_b(b_41),.out_c(c_41));
pe pe_42(.clk(clk),.rst(rst),.en(en6),.in_a(a_41),.in_b(b_32),.out_a(a_42),.out_b(b_42),.out_c(c_42));
pe pe_43(.clk(clk),.rst(rst),.en(en7),.in_a(a_42),.in_b(b_33),.out_a(a_43),.out_b(b_43),.out_c(c_43));
pe pe_44(.clk(clk),.rst(rst),.en(en8),.in_a(a_43),.in_b(b_34),.out_a(a_44),.out_b(b_44),.out_c(c_44));
pe pe_45(.clk(clk),.rst(rst),.en(en9),.in_a(a_44),.in_b(b_35),.out_a(a_45),.out_b(b_45),.out_c(c_45));
pe pe_46(.clk(clk),.rst(rst),.en(en10),.in_a(a_45),.in_b(b_36),.out_a(a_46),.out_b(b_46),.out_c(c_46));
pe pe_47(.clk(clk),.rst(rst),.en(en11),.in_a(a_46),.in_b(b_37),.out_a(a_47),.out_b(b_47),.out_c(c_47));

pe pe_50(.clk(clk),.rst(rst),.en(en5),.in_a(reg_a_5),.in_b(b_40),.out_a(a_50),.out_b(b_50),.out_c(c_50));
pe pe_51(.clk(clk),.rst(rst),.en(en6),.in_a(a_50),.in_b(b_41),.out_a(a_51),.out_b(b_51),.out_c(c_51));
pe pe_52(.clk(clk),.rst(rst),.en(en7),.in_a(a_51),.in_b(b_42),.out_a(a_52),.out_b(b_52),.out_c(c_52));
pe pe_53(.clk(clk),.rst(rst),.en(en8),.in_a(a_52),.in_b(b_43),.out_a(a_53),.out_b(b_53),.out_c(c_53));
pe pe_54(.clk(clk),.rst(rst),.en(en9),.in_a(a_53),.in_b(b_44),.out_a(a_54),.out_b(b_54),.out_c(c_54));
pe pe_55(.clk(clk),.rst(rst),.en(en10),.in_a(a_54),.in_b(b_45),.out_a(a_55),.out_b(b_55),.out_c(c_55));
pe pe_56(.clk(clk),.rst(rst),.en(en11),.in_a(a_55),.in_b(b_46),.out_a(a_56),.out_b(b_56),.out_c(c_56));
pe pe_57(.clk(clk),.rst(rst),.en(en12),.in_a(a_56),.in_b(b_47),.out_a(a_57),.out_b(b_57),.out_c(c_57));


pe pe_60(.clk(clk),.rst(rst),.en(en6),.in_a(reg_a_6),.in_b(b_50),.out_a(a_60),.out_b(b_60),.out_c(c_60));
pe pe_61(.clk(clk),.rst(rst),.en(en7),.in_a(a_60),.in_b(b_51),.out_a(a_61),.out_b(b_61),.out_c(c_61));
pe pe_62(.clk(clk),.rst(rst),.en(en8),.in_a(a_61),.in_b(b_52),.out_a(a_62),.out_b(b_62),.out_c(c_62));
pe pe_63(.clk(clk),.rst(rst),.en(en9),.in_a(a_62),.in_b(b_53),.out_a(a_63),.out_b(b_63),.out_c(c_63));
pe pe_64(.clk(clk),.rst(rst),.en(en10),.in_a(a_63),.in_b(b_54),.out_a(a_64),.out_b(b_64),.out_c(c_64));
pe pe_65(.clk(clk),.rst(rst),.en(en11),.in_a(a_64),.in_b(b_55),.out_a(a_65),.out_b(b_65),.out_c(c_65));
pe pe_66(.clk(clk),.rst(rst),.en(en12),.in_a(a_65),.in_b(b_56),.out_a(a_66),.out_b(b_66),.out_c(c_66));
pe pe_67(.clk(clk),.rst(rst),.en(en13),.in_a(a_66),.in_b(b_57),.out_a(a_67),.out_b(b_67),.out_c(c_67));

pe pe_70(.clk(clk),.rst(rst),.en(en7),.in_a(reg_a_7),.in_b(b_60),.out_a(a_70),.out_b(b_70),.out_c(c_70));
pe pe_71(.clk(clk),.rst(rst),.en(en8),.in_a(a_70),.in_b(b_61),.out_a(a_71),.out_b(b_71),.out_c(c_71));
pe pe_72(.clk(clk),.rst(rst),.en(en9),.in_a(a_71),.in_b(b_62),.out_a(a_72),.out_b(b_72),.out_c(c_72));
pe pe_73(.clk(clk),.rst(rst),.en(en10),.in_a(a_72),.in_b(b_63),.out_a(a_73),.out_b(b_73),.out_c(c_73));
pe pe_74(.clk(clk),.rst(rst),.en(en11),.in_a(a_73),.in_b(b_64),.out_a(a_74),.out_b(b_74),.out_c(c_74));
pe pe_75(.clk(clk),.rst(rst),.en(en12),.in_a(a_74),.in_b(b_65),.out_a(a_75),.out_b(b_75),.out_c(c_75));
pe pe_76(.clk(clk),.rst(rst),.en(en13),.in_a(a_75),.in_b(b_66),.out_a(a_76),.out_b(b_76),.out_c(c_76));
pe77 pe_77(.clk(clk),.rst(rst),.en(en14),.in_a(a_76),.in_b(b_67),.out_a(a_77),.out_b(b_77),.out_c(c_77),.finish_flag(finish_flag_wire));
endmodule