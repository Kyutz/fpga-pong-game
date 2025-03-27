module pong(clk, row, column, left, right, pause, reset, barra, bola);
	input clk;
	input [9:0] row, column;
	input right, left, pause, reset;
	output reg barra;
	output reg bola;
	
	reg innerClk;
	reg velocidade;
	reg [19:0] innerCounter;
	reg [19:0] innerVelocidade;
	reg [9:0] x = 439;
	reg [9:0] y = 320;
	reg [9:0] x1 = 20;
	reg [9:0] y1 = 320;
	reg [9:0] cont_aux = 0;
	reg [9:0] cont_aux2 = 0;
	reg [9:0] colisao = 0;
	reg [9:0] cont = 0;
	
	// Lógica para desenhar a figura na tela
	always@(posedge clk)
		begin
			barra <= (row < x + 10  && row > x && column < y + 70 && column > y)? 1 : 0;
			bola <= (row < x1 + 12 && row > x1 && column < y1 + 12 && column > y1)? 1 : 0;		
		end
	
	 //Divisor de frequência gerando 200Hz de saída em innerClk
	always@(posedge clk)
	begin
		innerCounter <= (innerCounter >= 85875)? 0 : innerCounter + 1;
		innerClk <= (innerCounter == 85874)? 1 : 0;
	end
	
	// Contador para mover a figura na tela para esquerda ou direita
	always@(posedge innerClk)
	begin
		if(reset)
		begin
			if(right == 0)
				y <= (y >= 565)? 565 : y + 1;
			if (left == 0)
				y <= (y <= 0)? 0 : y - 1;	
		end
		
		if(!reset)
		begin
			x <= 439;
			y <= 320;
		end
	end
		
		always@(posedge innerClk)
		begin
			if(!reset)
			begin
				cont = 0;
				x1 <= 20;
				y1 <= 320;
				cont_aux = 0;
				colisao = 0;
			end
			
			if(reset)
			begin
				if(cont == 0)
				begin
					x1 <= x1 + 1;
				end
			
				if(x == x1 + 12 && y < y1 + 12 && y + 30 > y1)
				begin
					colisao = 1;
					cont_aux = 0;
					cont_aux2 = 0;
					cont = 1;
				end
			
				if(x == x1 + 12 && y + 35 > y1 && y1 + 12 > y + 30)
				begin
					colisao = 2;
					cont_aux = 0;
					cont_aux2 = 0;
					cont = 1;
				end
			
				if(x == x1 + 12 && y + 70 > y1 && y1 + 12 > y + 40)
				begin
					colisao = 3;
					cont_aux2 = 0;
					cont_aux = 0;
					cont = 1;
				end
				
				if(x == x1 + 12 && y + 40 > y1 && y1 + 12 > y + 35)
				begin
					colisao = 4;
					cont_aux = 0;
					cont_aux2 = 0;
					cont = 1;
				end
				

				if(colisao == 1)
				begin
					x1 <= x1 - 1;
					y1 <= y1 - 1;
					cont_aux = 0;
				end
				
				if(colisao == 2)
				begin				
					x1 <= x1 - 1;
					y1 <= y1 - 1;
					y1 <= y1 - 1;
					cont_aux = 0;
				end
				
				if(colisao == 3)
				begin	
					x1 <= x1 - 1;
					y1 <= y1 + 1;
					cont_aux = 0;
				end
				
				if(colisao == 4)
				begin
					
					x1 <= x1 - 1;
					y1 <= y1 + 1;
					y1 <= y1 + 1;		
					cont_aux = 0;
				end
			
				if(y1 == 630 && cont_aux == 0)
				begin
					cont_aux = 1;
					colisao = 0;
				end
			
				if(cont_aux == 1)
				begin
					x1 <= x1 - 1;
					y1 <= y1 - 1;
				end
				
				if(x1 == 0 && cont_aux == 1)
				begin
					cont_aux = 2;
				end
				
				if(cont_aux == 2)
				begin
					x1 <= x1 + 1;
					y1 <= y1 - 1;
					colisao = 0;
				end
				
				if(y1 == 0 && cont_aux == 2)
				begin
					cont_aux = 3;
				end
				
				if(cont_aux == 3)
				begin
					x1 <= x1 + 1;
					y1 <= y1 + 1;
				end
				
				
				if(y1 == 0 && cont_aux == 0 && colisao != 2)
				begin
					colisao = 0;
					cont_aux = 4;
				end 
				
				if(cont_aux == 4)
				begin
					x1 <= x1 - 1;
					y1 <= y1 + 1;
				end
				
				if(x1 == 0 && cont_aux == 4)
				begin
					cont_aux = 5;
				end
				
				if(cont_aux == 5)
				begin
					x1 <= x1 + 1;
					y1 <= y1 + 1;
				end 
				
				if(y1 == 630 && cont_aux == 5)
				begin
					cont_aux = 6;
				end
				
				if(cont_aux == 6)
				begin
					x1 <= x1 + 1;
					y1 <= y1 - 1;
				end
				

				
				if(cont_aux == 0 && x1 == 0 && colisao == 3)
				begin
					colisao = 0;
					cont_aux = 8;
				end
				
				if(cont_aux == 8)
				begin
					x1 <= x1 + 1;
					y1 <= y1 + 1;
				end
				
				if(cont_aux == 8 && y1 == 630)
				begin
					cont_aux = 9;
				end
				
				if(cont_aux == 9)
				begin
					x1 <= x1 + 1;
					y1 <= y1 - 1;
				end
				
				if(cont_aux == 0 && x1 == 0 && colisao == 1)
				begin
					colisao = 0;
					cont_aux = 10;
				end
				
				if(cont_aux == 10)
				begin
					x1 <= x1 + 1;
					y1 <= y1 - 1;
				end
				
				if(y1 == 0 && cont_aux == 10)
				begin
					cont_aux = 11;
				end	
				
				if(cont_aux == 11)
				begin
					x1 <= x1 + 1;
					y1 <= y1 + 1;
				end
				
			
				
				if(colisao == 4 && x1 <= 0 && cont_aux == 0)
				begin
					colisao = 0;
					cont_aux = 16;
				end
				
				if(cont_aux == 16)
				begin
					x1 <= x1 + 1;
					y1 <= y1 + 1;
				end
				
				if(cont_aux == 16 && y1 == 630)
				begin
					cont_aux = 17;
				end
				
				if(cont_aux == 17)
				begin
					x1 <= x1 + 1;
					y1 <= y1 - 1;
				end
				
				if(colisao == 4 && y1 >= 630 && cont_aux == 0)
				begin
					colisao = 0;
					cont_aux = 18;
				end
				
				if(cont_aux == 18)
				begin
					x1 <= x1 - 1;
					y1 <= y1 - 1;
				end
				
				if(cont_aux == 18 && x1 == 0)
				begin
					cont_aux = 19;
				end
				
				if(cont_aux == 19)
				begin
					x1 <= x1 + 1;
					y1 <= y1 - 1;
				end
				
				if(cont_aux == 19 && y1 <= 0)
				begin
					cont_aux = 25;
				end
				
				if(cont_aux == 25)
				begin
					x1 <= x1 + 1;
					y1 <= y1 + 1;
				end
				
				if(colisao == 2 && x1 <= 0 && cont_aux == 0)
				begin
					colisao = 0;
					cont_aux = 20;
				end
				
				if(cont_aux == 20)
				begin
					x1 <= x1 + 1;
					y1 <= y1 - 1;
				end
				
				if(cont_aux == 20 && y1 <= 0)
				begin
					cont_aux = 21;
				end
				
				if(cont_aux == 21)
				begin
					x1 <= x1 + 1;
					y1 <= y1 + 1;
				end
				
				if(colisao == 2 && y1 <= 0 && cont_aux == 0)
				begin
					colisao = 0;
					cont_aux = 22;
				end
				
				if(cont_aux == 22)
				begin
					x1 <=  x1 - 1;
					y1 <=  y1 + 1;
				end
				
				if(cont_aux == 22 && x1 <= 0)
				begin
					cont_aux = 23;
				end
				
				if(cont_aux == 23)
				begin
					x1 <= x1 + 1;
					y1 <= y1 + 1;
				end
				
				if(cont_aux == 23 && y1 >= 630)
				begin
					cont_aux = 24;
				end
				
				if(cont_aux == 24)
				begin
					x1 <= x1 + 1;
					y1 <= y1 - 1;
				end
				
				
				
				if(x1 >= 460 || x1 < 0)
				begin
					cont = 0;
					y1 <= 320;
					x1 <= 20;
					cont_aux = 0;
					colisao = 0;
				end
			end	
		end
endmodule 