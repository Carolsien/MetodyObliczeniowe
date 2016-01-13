require "matrix"
#require "newtoncore"

def numeric?(object)
	true if Float(object) rescue false
end

begin
	#pobranie wartosci k
	puts "Podaj dokladnosc (ile miejsc po przecinku) k: "
	k = $stdin.gets.chomp.to_i
	if(k < 1)
		until k >= 1 do
			puts "Liczba k powinna byc wieksza lub rowna 1. Wprowadz poprawna wartosc."
			k = $stdin.gets.chomp.to_i
		end
	else
		puts "Wprowadzono liczbe k = #{k}"
	end

	#pobranie wartosci x0
	puts "Podaj liczbe x0: "
	input = $stdin.gets.chomp
	while(!numeric? input)
		puts "'#{input}' to nie liczba"
		input = $stdin.gets.chomp
	end
	x0 = input.to_f

	#pobranie wartosci y0
	puts "Podaj liczbe y0: "
	input = $stdin.gets.chomp
	while(!numeric? input)
		puts "'#{input}' to nie liczba"
		input = $stdin.gets.chomp
	end
	y0 = input.to_f

	nt = Newton.new(x0,y0)
	nt.printV(nt.compute(k))

	puts "Czy kontynuowac? y/n"
	input = $stdin.gets.chomp

end while (input == "y")
