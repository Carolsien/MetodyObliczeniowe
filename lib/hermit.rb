require 'hermitcore'

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

#pobranie przedzialu ab
puts "Podaj liczbe naturalna a: "
a = $stdin.gets.chomp.to_i
puts "Podaj liczbe naturalna b: "
b = $stdin.gets.chomp.to_i
if(a > b || a == b)
	puts "Lewa wartosc (a) przedziału powinna byc wieksza niz prawa wartosc (b)"
	until a < b do
		puts "Podaj liczbe naturalna a: "
		a = $stdin.gets.chomp.to_i
		puts "Podaj liczbe naturalna b: "
		b = $stdin.gets.chomp.to_i
	end
end
puts "Wprowadzono przedzial [a,b] = #{[a,b]}"

#pobranie wartosci yi
puts "Podaj wartosci y: "
y = []
while (y.length <= n)
	puts "y#{y.length}: "
	input = gets.chomp
	if(input.eql? input.to_i.to_s)
		y.push(input)
	else
		puts "#{input} to nie liczba"
	end
end

#pobranie wartosci zi
puts "Podaj wartosci z: "
z = []
while (z.length <= n)
	puts "z#{z.length}: "
	input = gets.chomp
	if(input.eql? input.to_i.to_s)
		z.push(input)
	else
		puts "'#{input}' to nie liczba"
	end
end
	
h = Hermit.new(a,b,n,y,z)
h.compute()
h.printW(h.getW())
