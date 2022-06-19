module delay(
  input wire clk,
	input wire rst,
  input wire en,
  output reg en0,
  output reg en1,
  output reg en2,
  output reg en3,  
  output reg en4,
  output reg en5,
  output reg en6,
  output reg en7,
  output reg en8,
  output reg en9,
  output reg en10,
  output reg en11,
  output reg en12,
  output reg en13,
  output reg en14


);

always@(posedge clk or negedge rst)
begin
	if (!rst)
		begin
      en0 <= 0;
      en1 <= 0;
      en2 <= 0;
      en3 <= 0;
      en4 <= 0;
      en5 <= 0;
      en6 <= 0;
      en7 <= 0;
      en8 <= 0;
      en9 <= 0;
      en10 <= 0;
      en11 <= 0;
      en12 <= 0;
      en13 <= 0;
      en14 <= 0;


		end
	else begin

    en14 <= en13;      
    en13 <= en12;
    en12 <= en11;
    en11 <= en10;
    en10 <= en9;
    en9 <= en8;
    en8 <= en7;
    en7 <= en6;
    en6 <= en5;
    en5 <= en4;
    en4 <= en3;
    en3 <= en2;
    en2 <= en1;
    en1 <= en0;
    en0 <= en;
  end
	end


  endmodule