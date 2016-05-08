require_relative 'posiciones'


class Fichas
attr_accessor :movimiento_norte, :movimiento_este, :movimiento_sur, :movimiento_oeste, :movimiento_noreste, :movimiento_sureste, :movimiento_suroeste, :movimiento_noroeste
	def initialize
		@movimiento_norte = [-1, 0]
		@movimiento_este = [0, 1]
		@movimiento_sur = [1, 0]
		@movimiento_oeste = [0, -1]		
		@movimiento_noreste = [-1, 1]
		@movimiento_sureste = [1, 1]
		@movimiento_suroeste = [1, -1]
		@movimiento_noroeste = [-1, -1]
	end
end

class Peon < Fichas
	def test(movimiento, destino, color, fichas_intermedias)
		if fichas_intermedias.any? { |x| x != "--" } 
			return "Invalid"
		else
			if color == "b"
				if (movimiento == movimiento_sur) && (destino[1].to_s == "-")
					return "Valid"
				elsif (movimiento == movimiento_sureste) && (destino[0].to_s == "w")
					return "Valid"
				elsif (movimiento == movimiento_suroeste) && (destino[0].to_s == "w")
					return "Valid"
				elsif movimiento == [2, 0]
					return "Valid"
				else
					return "Invalid"
				end
			elsif color == "w"
				if (movimiento == movimiento_norte) && (destino[0].to_s == "-")
					return "Valid"
				elsif (movimiento == movimiento_noreste) && (destino[0].to_s == "b")
					return "Valid"
				elsif (movimiento == movimiento_noroeste) && (destino[0].to_s == "b")
					return "Valid"
				elsif movimiento == [-2, 0]
					return "Valid"
				else
					return "Invalid"
				end
			end
		end	


			if color == destino[0]
				return "Invalid"
			else
				if movimiento[0].abs == movimiento[1].abs

				if (movimiento == @movimiento_sur) and (color == "b")
					return "Valid"
				elsif (movimiento == @movimiento_norte) and (color == "w")
					return "Valid"
				elsif (movimiento == (@movimiento_noreste || @movimiento_sureste = [1, 1] || @movimiento_suroeste = [1, -1] || @movimiento_noroeste) ) and destino[0] != "-"					
					return "Valid"
				elsif movimiento == [-2, 0]
					return "Valid"
				elsif movimiento == [2, 0]
					return "Valid"	
				else
					return "Invalid"
				end
			end
		end
	end
end

class Tower < Fichas
	def test(movimiento,destino, color, fichas_intermedias)
		if fichas_intermedias.any? { |x| x != "--" } 
			return "Invalid"
		else
			if color == destino[0]
				return "Invalid"
			else
				if movimiento[0] == 0
					return "Valid"
				elsif movimiento[1] == 0
					return "Valid"
				else
					return "Invalid"
				end	
			end
		end
	end
end

class Horse < Fichas
	def test(movimiento, destino, color, fichas_intermedias)
		if color == destino[0]
			return "Invalid"
		else
			if (movimiento[0] == -1 or 1) and (movimiento[1] == -2 or 2)
				return "Valid"
			elsif (movimiento[0] == -2 or 2) and (movimiento[1] == -1 or 1)
				return "Valid"
			else
				return "Invalid"
			end
		end
	end
end

class Bishop < Fichas
	def test(movimiento, destino, color, fichas_intermedias)
		if fichas_intermedias.any? { |x| x != "--" } 
			return "Invalid fichasinter"
		else
			if color == destino[0]
				return "Invalid color"
			else
				if movimiento[0].abs == movimiento[1].abs
					return "Valid"
				else
					return "Invalid else"
				end
			end
		end
	end
end

class Queen < Fichas
	def test(movimiento,destino, color, fichas_intermedias)
		if fichas_intermedias.any? { |x| x != "--" } 
			return "Invalid"
		else
			if color == destino[0]
				return "Invalid"
			else
				if movimiento[0] || movimiento[1] == 0
					return "Valid"
				elsif movimiento[0] == movimiento[1] 
					return "Valid"
				elsif movimiento[0] + movimiento[1] == 0
					return "Valid"
				else
					return "Invalid"
				end
			end
		end
	end
end

class King < Fichas
	def test(movimiento,destino, color, fichas_intermedias)
		if color == destino[0]
			return "Invalid"
		else
			if movimiento == @movimiento_norte 
				return "Valid"                               
			elsif movimiento == @movimiento_este 
				return "Valid"                               
			elsif movimiento == @movimiento_sur  
				return "Valid"                   
			elsif movimiento == @movimiento_oeste  
				return "Valid"                    		
			elsif movimiento == @movimiento_noreste 
				return "Valid"                    
			elsif movimiento == @movimiento_sureste 
				return "Valid"                      
			elsif movimiento == @movimiento_suroeste
				return "Valid"                        
			elsif movimiento == @movimiento_noroeste
				return "Valid"   
			elsif color == "w"
				if movimiento == [0, 2]  
					return "Enroque white derecha"  
				elsif movimiento == [0, -2]  
					return "Enroque white izquierda"
				end     
			elsif color == b
				if movimiento == [0, 2]  
					return "Enroque black derecha"  
				elsif movimiento == [0, -2]  
					return "Enroque black izquierda"
				end                       
			else
				return "Invalid"
			end
		end
	end
end
