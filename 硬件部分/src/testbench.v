`include "./pe_array.v"
`timescale 1ns/1ps
module testbench();
reg [15:0]I_mem[511:0];
reg [15:0]R_mem[511:0];
wire [10:0]ad;
wire [15:0]datai;
wire [15:0]datar;
reg clk;
reg rst;
reg [6:0]t;
reg [3:0]i;
reg [5:0]j;
reg [5:0]j_tmp;
reg [255:0]input_all;
reg en;
reg finish;
wire finish_flag;
// wire [31:0]reg_c_00;wire [31:0]reg_c_01;wire [31:0]reg_c_02;wire [31:0]reg_c_03;wire [31:0]reg_c_04;wire [31:0]reg_c_05;wire [31:0]reg_c_06;wire [31:0]reg_c_07;
// wire [31:0]reg_c_10;wire [31:0]reg_c_11;wire [31:0]reg_c_12;wire [31:0]reg_c_13;wire [31:0]reg_c_14;wire [31:0]reg_c_15;wire [31:0]reg_c_16;wire [31:0]reg_c_17;
// wire [31:0]reg_c_20;wire [31:0]reg_c_21;wire [31:0]reg_c_22;wire [31:0]reg_c_23;wire [31:0]reg_c_24;wire [31:0]reg_c_25;wire [31:0]reg_c_26;wire [31:0]reg_c_27;
// wire [31:0]reg_c_30;wire [31:0]reg_c_31;wire [31:0]reg_c_32;wire [31:0]reg_c_33;wire [31:0]reg_c_34;wire [31:0]reg_c_35;wire [31:0]reg_c_36;wire [31:0]reg_c_37;
// wire [31:0]reg_c_40;wire [31:0]reg_c_41;wire [31:0]reg_c_42;wire [31:0]reg_c_43;wire [31:0]reg_c_44;wire [31:0]reg_c_45;wire [31:0]reg_c_46;wire [31:0]reg_c_47;
// wire [31:0]reg_c_50;wire [31:0]reg_c_51;wire [31:0]reg_c_52;wire [31:0]reg_c_53;wire [31:0]reg_c_54;wire [31:0]reg_c_55;wire [31:0]reg_c_56;wire [31:0]reg_c_57;
// wire [31:0]reg_c_60;wire [31:0]reg_c_61;wire [31:0]reg_c_62;wire [31:0]reg_c_63;wire [31:0]reg_c_64;wire [31:0]reg_c_65;wire [31:0]reg_c_66;wire [31:0]reg_c_67;
// wire [31:0]reg_c_70;wire [31:0]reg_c_71;wire [31:0]reg_c_72;wire [31:0]reg_c_73;wire [31:0]reg_c_74;wire [31:0]reg_c_75;wire [31:0]reg_c_76;wire [31:0]reg_c_77;
integer fd;
initial begin
  $display("start a clock pulse");    // 打印开始标记
    $dumpfile("test.vcd");              // 指定记录模拟波形的文件
    $dumpvars(0,testbench);          // 指定记录的模块层级
    $readmemb("./I.txt",I_mem);
    $readmemb("./R.txt",R_mem);

    clk<=0;
    rst<=1;
    finish<=0;
    #1 rst<=0;
    #1 rst<=1;


     #1000 $finish; 
    // while (!finish)
    //     #0.5;
    // $finish;
    $display("finish!");
  end

pe_array pe_array(  
.clk(clk),.rst(rst),
  .en(en),//testbench
  .input_a_0(input_all[31:0]),
  .input_a_1(input_all[63:32]),
  .input_a_2(input_all[95:64]),
  .input_a_3(input_all[127:96]),
  .input_a_4(input_all[159:128]),
  .input_a_5(input_all[191:160]),
  .input_a_6(input_all[223:192]),
  .input_a_7(input_all[255:224]),


  .finish_flag(finish_flag)
  );

always@(posedge clk or negedge rst)
begin
	if (!rst)
		begin
    en<= 1;
    t <= 0 ;
    i<=0;
    j<=0;
    j_tmp<=0;
    input_all <= 0;
		end
	else begin

    if(t<7+64)begin//t 时间，t加1进一个数据
        if (t<7) begin

          for (i=0; i<=t; i=i+1) begin
            j=t-i;
            input_all[(32*i+31)-:32]={R_mem[j*8+i],I_mem[j*8+i]};//对输入进行拼接
          end

          for (j_tmp=i; j_tmp<=7; j_tmp=j_tmp+1) begin//补零
              input_all[(32*j_tmp+31)-:32]=0;
          end

        end

        else if(t>=7 && t<64) begin
          // $display("t=%d\n",t);
          for (i=0; i<=7; i=i+1) begin
            j=t-i;
            input_all[(32*i+31)-:32]={R_mem[j*8+i],I_mem[j*8+i]};
          end
        end 

        else if(t>=64)begin
          // $display("t=%d\n",t);
          en<=1;
          for (i=t-63; i<=7; i=i+1) begin
            j=t-i;
            input_all[(32*i+31)-:32]={R_mem[j*8+i],I_mem[j*8+i]};
          end
          for (j_tmp=t-64; $signed(j_tmp)>=0; j_tmp=j_tmp-1) begin//补零
              input_all[(32*j_tmp+31)-:32]=0;
          end
        end

        t<=t+1;

    end
        end
  end


    always begin
        #2.5 clk = ~clk;
    end       
// always@(posedge clk)//写文件
// begin
//   if(finish_flag==1)
//   begin
// fd=$fopen("result.txt","w");
// $fwrite(fd,"%d%s%d%s\t",reg_c_00[31:16],"+",reg_c_00[15:0],"i"); //写入文件
// finish<=1;
//   end
// end         
// assign datai=I_mem[0];
// assign datar=R_mem[ad];
endmodule


// .reg_c_00(reg_c_00),.reg_c_01(reg_c_01),.reg_c_02(reg_c_02),.reg_c_03(reg_c_03),.reg_c_04(reg_c_04),.reg_c_05(reg_c_05),.reg_c_06(reg_c_06),.reg_c_07(reg_c_07),
// .reg_c_10(reg_c_10),.reg_c_11(reg_c_11),.reg_c_12(reg_c_12),.reg_c_13(reg_c_13),.reg_c_14(reg_c_14),.reg_c_15(reg_c_15),.reg_c_16(reg_c_16),.reg_c_17(reg_c_17),
// .reg_c_20(reg_c_20),.reg_c_21(reg_c_21),.reg_c_22(reg_c_22),.reg_c_23(reg_c_23),.reg_c_24(reg_c_24),.reg_c_25(reg_c_25),.reg_c_26(reg_c_26),.reg_c_27(reg_c_27),
// .reg_c_30(reg_c_30),.reg_c_31(reg_c_31),.reg_c_32(reg_c_32),.reg_c_33(reg_c_33),.reg_c_34(reg_c_34),.reg_c_35(reg_c_35),.reg_c_36(reg_c_36),.reg_c_37(reg_c_37),
// .reg_c_40(reg_c_40),.reg_c_41(reg_c_41),.reg_c_42(reg_c_42),.reg_c_43(reg_c_43),.reg_c_44(reg_c_44),.reg_c_45(reg_c_45),.reg_c_46(reg_c_46),.reg_c_47(reg_c_47),
// .reg_c_50(reg_c_50),.reg_c_51(reg_c_51),.reg_c_52(reg_c_52),.reg_c_53(reg_c_53),.reg_c_54(reg_c_54),.reg_c_55(reg_c_55),.reg_c_56(reg_c_56),.reg_c_57(reg_c_57),
// .reg_c_60(reg_c_60),.reg_c_61(reg_c_61),.reg_c_62(reg_c_62),.reg_c_63(reg_c_63),.reg_c_64(reg_c_64),.reg_c_65(reg_c_65),.reg_c_66(reg_c_66),.reg_c_67(reg_c_67),
// .reg_c_70(reg_c_70),.reg_c_71(reg_c_71),.reg_c_72(reg_c_72),.reg_c_73(reg_c_73),.reg_c_74(reg_c_74),.reg_c_75(reg_c_75),.reg_c_76(reg_c_76),.reg_c_77(reg_c_77),