#  a  b  c  d  e  f  g  h
# bT bC bB bQ bK bB bC bT	8
# bP bP bP bP bP bP bP bP	7
# -- -- -- -- -- -- -- --	6
# -- -- -- -- -- -- -- --	5
# -- -- -- -- -- -- -- --	4
# -- -- -- -- -- -- -- --	3
# wP wP wP wP wP wP wP wP	2
# wT wC wA wQ wK wA wC wT	1
			
class Posiciones
attr_accessor :pos_arr_eje_vertical_inicial, :pos_arr_eje_horizontal_inicial, :pos_arr_eje_vertical_final, :pos_arr_eje_horizontal_final
	def initialize(posiciones)
		posicion_inicial_letra = coordenada[0][0]
		numeracion_posicion_inicial_letra = posicion_inicial_letra.ord
		posicion_inicial_numero = coordenada[0][1]
		@pos_arr_eje_vertical_inicial = 8 - posicion_inicial_numero.to_i
		@pos_arr_eje_horizontal_inicial = numeracion_posicion_inicial_letra - 97

		posicion_final_letra = coordenada[1][0]
		numeracion_posicion_final_letra = posicion_final_letra.ord
		posicion_final_numero = coordenada[1][1]
		@pos_arr_eje_vertical_final = 8 - posicion_final_numero.to_i
		@pos_arr_eje_horizontal_final = numeracion_posicion_final_letra - 97

		puts "COORDENADAS: #{coordenada}"
		puts "POS. INICIAL LETRA: #{posicion_inicial_letra} --- POS. EN ARRAY: #{@pos_arr_eje_horizontal_inicial} "
		puts "POS. INICIAL NUMERO #{posicion_inicial_numero} --- POS. EN ARRAY: #{@pos_arr_eje_vertical_inicial}"
		puts "POS. FINAL LETRA:   #{posicion_final_letra} --- POS. EN ARRAY: #{@pos_arr_eje_horizontal_final} "
		puts "POS. FINAL NUMERO   #{posicion_final_numero} --- POS. EN ARRAY: #{@pos_arr_eje_vertical_final}"
	end 
end










#def distancia_entre_coordenadas(posicion_inicial_letra, posicion_inicial_numero, posicion_final_letra, posicion_final_numero)
#	distancia_vertical = posicion_inicial_numero.to_i - posicion_final_numero.to_i
#	distancia_horizontal = posicion_inicial_letra.char.to_i - posicion_final_letra.char.to_i
#
#	puts "La distancia vertical es #{distancia_vertical}"
#	puts "La distancia horizontal es #{distancia_horizontal}"
#end
#
#puts distancia_entre_coordenadas(a, 2, a, 3)