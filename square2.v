module square2(clk, row, column, upDown, leftRight, enableUpDown, enableLeftRight, draw, draw2);
	input clk;
	input [9:0] row, column;
	input upDown, leftRight, enableUpDown, enableLeftRight;
	output reg draw;
	output reg draw2;
	
	reg innerClk;
	reg [19:0] innerCounter;
	reg [9:0] x = 460;
	reg [9:0] y = 295;
	reg [9:0] x1 = 150;
	reg [9:0] y1 = 295;
	
	// L�gica para desenhar a figura na tela
	always@(posedge clk)
		begin
			draw <= (row < x + 10  && row > x && column < y + 50 && column > y)? 1 : 0;
		end
		always@(posedge clk)
		begin
			draw2 <= (row < x1 + 80  && row > x1 && column < y1 + 70 && column > y1)? 1 : 0;
		end
	 //Divisor de frequ�ncia gerando 200Hz de sa�da em innerClk
	always@(posedge clk)
	begin
		innerCounter <= (innerCounter >= 125875)? 0 : innerCounter + 1;
		innerClk <= (innerCounter == 125874)? 1 : 0;
	end
	
	// Contador para mover a figura na tela para esquerda ou direita
	always@(posedge innerClk)
	begin
		if(enableLeftRight)
			if(leftRight == 0)
				y <= (y >= 585)? 585 : y + 1;
		if(enableUpDown)
			if (upDown == 0)
				y <= (y <= 0)? 0 : y - 1;

	
	end
	
endmodule 