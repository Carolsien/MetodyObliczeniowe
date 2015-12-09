x = [0,1,2]
t = [0,0,1,1,2,2]
ft = [1,1,2,2,3,3]
y = [1,2,3]
z = [1,1,0]
Rozm = t.length
tab = Array.new(Rozm, Array.new(Rozm))


for i in 0...Rozm
  tab[0][i] = ft[i].to_f
end

for i in 0...Rozm
  if tab[0][i] < 0
    print " #{tab[0][i]} |"
  else
    print " #{tab[0][i]}  |"
  end
end
puts

g=0

for i in 1...Rozm
  g=g+1
  for j in 0...Rozm-g
    if (t[j+g]-t[j]) == 0
      tab[i][j]=z[t[j]].to_f
      print " #{tab[i][j]}  |"
    else
      tab[i][j]=(tab[i-1][j+1]-tab[i-1][j])/(t[j+g]-t[j]).to_f
      if tab[i][j] < 0
        print " #{tab[i][j]} |"
      else
       print " #{tab[i][j]}  |"
      end
    end
  end
  puts
end



