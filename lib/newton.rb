require "matrix"
#require "newtoncore"

def numeric?(object)
	true if Float(object) rescue false
end

do
	#pobranie wartosci n
	puts "Podaj liczbe naturalna n: "
	n = $stdin.gets.chomp.to_i
	if(n < 1)
		until n >= 1 do
			puts "Liczba n powinna byc wieksza lub rowna 1. Wprowadz poprawna wartosc."
			n = $stdin.gets.chomp.to_i
		end
	else
		puts "Wprowadzono liczbe n = #{n}"
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
	nt.printV(nt.compute(n))

	puts "Czy kontynuowac? y/n"
	input = $stdin.gets.chomp

while (!input.eq? "n")
