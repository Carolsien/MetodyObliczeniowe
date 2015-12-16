class Hermit
	@n
	@a
	@b
	@x
	@y
	@z
	
	@t
	@f0
	@f

	@debug = false
    def initialize(a, b, n, y, z)
		@a = a.to_f
		@b = b.to_f
        @n = n.to_f
		@y = y
		@z = z
		@x = []
		# Obliczenie kroku h
		h = (b.to_f - a.to_f) / n.to_f
		# Wypelnienie danych x
		tx = a
		for i in Range.new(0, n)
			@x.push(tx)
			tx = tx + h
		end
    end

    def compute()
		x = @x
		y = @y
		z = @z

		# Tworzymy tablice t poprzez wstawienie x podwojnie
		t = []
		for i in x
			t.push(i.to_f)
			t.push(i.to_f)
		end
		@t = t

		# Tworzymy pierwszy wiersz z wielomianami stopnia pierwszego poprzez wpisanie wartosci funkcji i pochodnej dla kazdego punktu
		f0 = []
		for i in Range.new(0, t.count-1)
			f0.push(y[i].to_f)
			f0.push(z[i].to_f)
		end
		@f0 = f0

		# Inicjujemy tabele z wynikami
		tn = (@n - 1) * 2
		tab = Array.new(tn + 1, Array.new(tn + 1))
		wynik = []

		# Wstawiamy pierwszy wiersz do macierzy
		for i in Range.new(0, tn)
			k = f0[i].to_f
			tab[0][i] = k
			wynik.push(k) if i == 0

			if k < 0
				print " #{k} |" if @debug == true
			else
				print " #{k}  |" if @debug == true
			end
		end

		# Obliczamy macierz za pomoca metody
		g = 0
		for i in Range.new(1, tn)
			g = g + 1
			for j in Range.new(0, tn-g)
				# Sprawdzamy czy dzielenie przez 0
				d = t[j+g]-t[j]
				if (d == 0)
					k = z[t[j]].to_f
					tab[i][j] = k
					wynik.push(k) if j == 0
					print " #{k}  |" if @debug == true
				else
					k = ((tab[i-1][j+1] - tab[i-1][j]) / d).to_f
					puts "#{i} #{j}"
					tab[i][j] = k
					wynik.push(k) if j == 0
					if k < 0
						print " #{k} |" if @debug == true
					else
						print " #{k}  |" if @debug == true
					end
				end
			end
			puts if @debug == true
		end

		#Zapisujemy wyniki
		@f = wynik

		# Wydruk kontrolny obliczonych danych
		print "pierwsza kolumna: #{wynik}" if @debug == true
		puts if @debug == true
		print "perwszy wiersz: #{f0}" if @debug == true
    end

	def newton(n, k, setT)
		setT.take(n).combination(k).to_a
	end

    def getW()
		t = @t
		f = @f
		n = @n
		
		wynik = Array.new(n)

		for i in Range.new(0, n-1)
			if i > 0
				print " + " if @debug == true
			end
			print "x^#{i}(" if @debug == true
			wynik[i] = 0
			for j in Range.new(i, n-1)
				x = newton(j, j-i, t)
				if x.count > 0
					for a in x
						tmp = f[j]
						if j != i
							if (((j-i) % 2) == 0)
								tmp = f[j]
								print " + " if @debug == true
							else
								tmp = -tmp
								print " -  " if @debug == true
							end
						end
						print "f[#{j}]" if @debug == true
						for b in a
							print "*" if @debug == true
							print b if @debug == true
							tmp *= b
						end
						wynik[i] += tmp
					end
				end
			end
			print ")" if @debug == true
		end
		return wynik
    end

	def printW(w)
		puts "\n" if @debug == true
		puts "\n" if @debug == true
		n = w.count
		for i in Range.new(0, n-1)
			print "+" if i > 0 && w[i] > 0 && w[i-1] != 0
			print "#{w[i]}*" unless w[i] == 0 || w[i] == 1 || w[i] == -1
			print "-" if w[i] == -1
			print "x^#{i}" unless w[i] == 0
		end
	end
	
	def a()
		@a
	end
	def b()
		@b
	end
	def n()
		@n
	end
	def x()
		@x
	end
	def y()
		@y
	end
	def z()
		@z
	end
	def t()
		@t
	end
	def f()
		@f
	end
end
