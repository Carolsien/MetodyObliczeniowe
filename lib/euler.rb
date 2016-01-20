system("cls")
puts 'Podaj n... (n >= 1)'
n = gets.chomp.to_f
while n < 1
  puts 'Podaj wartosc >= 1'
  n = gets.chomp.to_f
end
puts

puts 'Podaj a... (a > 0)'
a = gets.chomp.to_f
while a <= 0
  puts 'Podaj wartosc > 0'
  a = gets.chomp.to_f
end
puts

$filtr = 1
$h = a/n
puts "h = #{$h}"
puts

$x = []
$y = []
$yz = []

$x.push(0)
$y.push(0)
$yz.push(0)

def f(x,y)
  x = x.to_f
  y = y.to_f
  (y**2.0+2.0*x*y+x**2.0)-x**4.0+2.0*x-1.0
end

def Xk(k)
  $x[k-1] + $h
end

def Yk(k)
  $y[k-1] + $h*f($x[k-1], $y[k-1])
end

def Ykz(k)
  $y[k-1] + $h*f($x[k-1]+$h/2.0, $y[k-1]+$h/2.0*f($x[k-1],$y[k-1]))
end

for k in 1...n
  $x.push(Xk(k))
  $y.push(Yk(k))
  $yz.push(Ykz(k))
end

=begin
puts 'Podac wszystkie wyniki czy filtorwac ? [1,2]'
puts '1. Wszystkie'
puts '2. Filtruj'
@f = gets.chomp.to_i

if @f == 2 then
  puts
  puts "Co ktory wynik wyswietlic ? [2,#{n.to_i}]"
  $filtr = gets.chomp.to_i
end
w = n.to_i/$filtr
puts
=end

def dobra(x)
  x = x.to_f
  return x**2 - x
end

def errory(x, metY)
  return (dobra(x) - metY).abs
end

puts 'X:                       Y (Euler):               Blad metody:             Y (Zmodyfikowany euler): Blad metody:'

def druknij(du)
  t = du.to_s
  printf t
  z = 25 - t.size
  printf ' '*z
end

for k in 0...n
  by = errory($x[k], $y[k])
  byz = errory($x[k], $yz[k])
  druknij($x[k])
  druknij($y[k])
  druknij(by)
  druknij($yz[k])
  druknij(byz)
  puts
end

