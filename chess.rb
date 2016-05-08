require_relative 'board'
require_relative 'fichas'
b = Board.new
#  a  b  c  d  e  f  g  h
# bT bC bA bQ bK bA bC bT	8
# bP bP bP bP bP bP bP bP	7
# -- -- -- -- -- -- -- --	6
# -- -- -- -- -- -- -- --	5
# -- -- -- -- -- -- -- --	4
# -- -- -- -- -- -- -- --	3
# wP wP wP wP wP wP wP wP	2
# wT wC wA wK wQ wA wC wT	1
turno = 1
while true do 
	if turno.even? == true
		letoca = "black"
	else
		letoca = "white"
	end
	puts
	puts "Mueven #{letoca}"	
	turno += 1			
	
	color = "z"
	until color == letoca[0]
		puts "CASILLA DE ORIGEN (ej:a2) ::"
		ini = gets.chomp.to_s
		puts "CASILLA DE DESTINO (ej:a4) ::"
		fin = gets.chomp.to_s
		arr = []
		arr << ini
		arr << fin
		a = b.posiciones(arr)	
		num_ini = a[0]
		letra_ini = a[1]
		num_fin = a[2]
		letra_fin = a[3]
		fich =  b.board[num_ini][letra_ini]
		destino = b.board[num_fin][letra_fin]
		puts	
		puts "FICHA :: #{fich}"
		puts "DESTINO :: #{destino}"
		puts "TIPO :: #{fich[1]}"
		color = fich[0]
		puts "COLOR :: #{color}"
		movimiento = [num_fin.to_i - num_ini.to_i, letra_fin.to_i - letra_ini.to_i]
		print "MOV ::: #{movimiento}"
		puts
	end

	arr_fich= []
	if (movimiento[0].abs == movimiento[1].abs) 
		if (movimiento[0] > 1) && (movimiento[1] > 1)
			cont = 1
			(movimiento[0]-1).times do
				arr_fich << b.board[(num_ini+cont)][letra_ini+cont]
				cont += 1
				puts cont
			end
		elsif (movimiento[0] > 1) && (movimiento[1] < -1)
			cont = 1
			(movimiento[0]-1).times do
				arr_fich << b.board[(num_ini+cont)][letra_ini-cont]
				cont += 1
				puts cont
			end
		elsif (movimiento[0] < -1) && (movimiento[1] > 1)
			cont = 1
			(movimiento[1]-1).times do
				arr_fich << b.board[(num_ini-cont)][letra_ini+cont]
				cont += 1
				puts cont
			end
		elsif (movimiento[0] < -1) && (movimiento[1] < -1)
			cont = 1
			(-movimiento[0]-1).times do
				arr_fich << b.board[(num_ini-cont)][letra_ini-cont]
				cont += 1
				puts cont
			end
		end
	elsif (movimiento[0].abs != movimiento[1].abs) 
		if movimiento[0] > 1
			cont = 1
			(movimiento[0]-1).times do
				arr_fich << b.board[(num_ini+cont)][letra_ini]
				cont += 1
				puts cont
			end	
		elsif movimiento[1] > 1
			cont = 1
			(movimiento[1]-1).times do
				arr_fich << b.board[(num_ini)][letra_ini+cont]
				cont +=1
			end	
		elsif movimiento[0] < -1
			cont = 1
			(-movimiento[0]-1).times do
				arr_fich << b.board[(num_ini-cont)][letra_ini]
				cont += 1
				puts cont
			end	
		elsif movimiento[1] < -1
			cont = 1
			(-movimiento[1]-1).times do
				arr_fich << b.board[(num_ini)][letra_ini-cont]
				cont += 1
				puts cont
			end
		end
	end

	puts "FICHAS INTERMEDIAS :: #{arr_fich}"
	puts

	case fich[1]
	when "P"
		p = Peon.new
		movement = p.test(movimiento, destino, color, arr_fich)
		if movement	 == "Valid"
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s
		else
			puts "Invalid"
		end
	when "T"
		t = Tower.new
		movement = t.test(movimiento, destino, color, arr_fich)
		if movement	 == "Valid"
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s
		else
			puts "Invalid"
		end
	when "H"
		h = Horse.new
		movement = h.test(movimiento, destino, color, arr_fich)
		if movement	 == "Valid"
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s
		else
			puts "Invalid"
		end
	when "A"
		a = Bishop.new
		movement = a.test(movimiento, destino, color, arr_fich)
		if movement	 == "Valid"
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s
		else
			puts "Invalid"
		end
	when "Q"
		q = Queen.new
		movement = q.test(movimiento, destino, color, arr_fich)
		if movement	 == "Valid"
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s
		else
			puts "Invalid"
		end
	when "K"
		k = King.new
		movement = k.test(movimiento, destino, color, arr_fich)
		if movement	 == "Valid"
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s
		elsif (movement == "Enroque white derecha") and (b.board[7][6] == "--") and (b.board[7][4] == "--") and (b.board[7][7] == "wT")
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s			
			b.board[7][7] = "--"
			b.board[7][4] = "wT"
			elsif (movement == "Enroque white izquierda") and (b.board[7][1] == "--") and (b.board[7][2] == "--") and (b.board[7][0] == "wT")
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s			
			b.board[7][0] = "--"
			b.board[7][2] = "wT"
			elsif (movement == "Enroque black derecha") and (b.board[0][5] == "--") and (b.board[0][6] == "--") and (b.board[0][7] == "bT")
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s			
			b.board[0][7] = "--"
			b.board[7][5] = "wT"
			elsif (movement == "Enroque black izquierda") and (b.board[0][1] == "--") and (b.board[0][2] == "--") and (b.board[0][0] == "bT")
			b.board[num_ini][letra_ini] = "--"
			b.board[num_fin][letra_fin] = fich.to_s			
			b.board[0][0] = "--"
			b.board[0][3] = "wT"
		else
			puts "Invalid"
		end
	else
		puts "Invalid"	
	end
		puts "-------------------------------------------------"
		puts

	cont=8
	puts "  a      b      c     d     e     f     g     h"
	b.board.each do|x|
		print x.to_s + cont.to_s 
		cont -= 1
		puts
	end
end
#Fichas de las posiciones iniciales



