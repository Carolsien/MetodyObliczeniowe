require "matrix"

class Newton
	@v0

    def initialize(x0, y0)
		@v0 = Vector[x0, y0]
    end

    def compute(k)
		prec = 0.1 ** k
		v = @v0
		last = Vector[@v0[0] - 2 * prec, @v0[1] - 2 * prec]
		n = 50

		i = 0
		while i < n and ((last[0] - v[0]).abs > prec or (last[1] - v[1]).abs > prec)
			last = v
			v = iter(v)
			i = i + 1
		end

		if i == n
			puts "Nie udalo sie osiagnac zadanej dokladnosci"
		end
		
		return v
    end

	def iter(v)
		return v - fd(v).inv * f(v)
	end

	def f(v)
		x = v[0]
		y = v[1]
		xv = (2 * (x ** 3)) - (y ** 2) - 1
		yv = (x * (y ** 2)) - y - 4
		return Vector[xv, yv] 
	end

	def fd(v)
		x = v[0]
		y = v[1]
		m11 = 2 * 3 * (x ** 2)
		m12 = -2 * y
		m21 = (y ** 3)
		m22 = 3 * x * (y ** 2) - 1
		return Matrix[[m11, m12], [m21, m22]]
	end
 
	def printV(v)
		print "v = #{v}\n"
	end

	# Gettery
	def v0()
		@v0
	end
end
