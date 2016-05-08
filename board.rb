require "colorize"
#  a  b  c  d  e  f  g  h
# bT bC bA bQ bK bA bC bT	8
# bP bP bP bP bP bP bP bP	7
# -- -- -- -- -- -- -- --	6
# -- -- -- -- -- -- -- --	5
# -- -- -- -- -- -- -- --	4
# -- -- -- -- -- -- -- --	3
# wP wP wP wP wP wP wP wP	2
# wT wC wA wK wQ wA wC wT	1
class Board
	attr_accessor :board
	def initialize
		black_fig = ["bT", "bH", "bA", "bQ", "bK", "bA", "bH", "bT"]
		black_peon = ["bP", "bP", "bP", "bP", "bP", "bP", "bP", "bP"]
		white_fig = ["wT", "wH", "wB", "wK", "wQ", "wB", "wH", "wT"]
		white_peon = ["wP", "wP", "wP", "wP", "wP", "wP", "wP", "wP"]
		empty1 = ["--", "--", "--", "--", "--", "--", "--", "--"]
		empty2 = ["--", "--", "--", "--", "--", "--", "--", "--"]
		empty3 = ["--", "--", "--", "--", "--", "--", "--", "--"]
		empty4 = ["--", "--", "--", "--", "--", "--", "--", "--"]
		@board = []
		@board << black_fig
		@board << black_peon
		@board << empty1
		@board << empty2
		@board << empty3
		@board << empty4
		@board << white_peon
		@board << white_fig
		cont=8
		puts "  a      b      c     d     e     f     g     h"
		@board.each do|x|
			print x.to_s + cont.to_s 
			cont -= 1
			puts
		end
	end

	def posiciones(coordenada)		
		posicion_inicial_letra = coordenada[0][0]
		numeracion_posicion_inicial_letra = posicion_inicial_letra.ord
		posicion_inicial_numero = coordenada[0][1]
		pos_arr_eje_vertical_inicial = 8 - posicion_inicial_numero.to_i
		pos_arr_eje_horizontal_inicial = numeracion_posicion_inicial_letra - 97

		posicion_final_letra = coordenada[1][0]
		numeracion_posicion_final_letra = posicion_final_letra.ord
		posicion_final_numero = coordenada[1][1]
		pos_arr_eje_vertical_final = 8 - posicion_final_numero.to_i
		pos_arr_eje_horizontal_final = numeracion_posicion_final_letra - 97

		puts "COORDENADAS: #{coordenada}"
		puts "POS. INICIAL NUMERO #{posicion_inicial_numero} --- POS. EN ARRAY: #{pos_arr_eje_vertical_inicial}"
		puts "POS. INICIAL LETRA: #{posicion_inicial_letra} --- POS. EN ARRAY: #{pos_arr_eje_horizontal_inicial} "
		puts "POS. FINAL NUMERO   #{posicion_final_numero} --- POS. EN ARRAY: #{pos_arr_eje_vertical_final}"
		puts "POS. FINAL LETRA:   #{posicion_final_letra} --- POS. EN ARRAY: #{pos_arr_eje_horizontal_final} "
			
		a = [pos_arr_eje_vertical_inicial, pos_arr_eje_horizontal_inicial, pos_arr_eje_vertical_final, pos_arr_eje_horizontal_final] 
		print a
		return a
	end 
end





