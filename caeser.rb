class Caeser
	attr_accessor :cypher
	
	def self.cypher_encrypt (cypher, num)
		code = []
		cypher = cypher.split('')
		cypher.each do |i|
			if i == ' ' then  
				code << i 
				next 
			end
			n = i.ord
			if n.between?(97, 122) then casing = "down" end
			if n.between?(65, 90) then casing = "up" end	
			if n.between?(48, 57) then casing = "number" end
			n += -num
			if n < 97 and casing == "down" then n = 122-(97-n)+1 end
			if n < 65 and casing == "up" then n = 90-(65-n)+1 end
			if n < 48 and casing == "number" then n = 57-(48-n) +1 end
			i = n.chr			
			code << i			
		end
		@cypher = code.join
		p @cypher
	end

end

Caeser.cypher_encrypt("hello world",1)
Caeser.cypher_encrypt("hello world az",1)
Caeser.cypher_encrypt("hello world az ABC 123",1)
Caeser.cypher_encrypt("hello world az ABC 123",5)