require 'simplecov'
SimpleCov.start

require 'hermitcore'

# Przykladowe dane z wykladu str 10
f1 = [0,2,1,0]
t1 = [1,2,4,5]
n1 = f.count

# Przykladowe dane z wykladu str 16
f2 = [0,1,0,-1,3,-2]
t2 = [0,0,1,1,1,2,2]
n2 = f.count

RSpec.describe Hermit do
	context "a=6, b=8, n=4" do
		it "checks if create instance correctly" do
			a = 6
			b = 8
			n = 4
			y = [1, 2, 3, 4, 5]
			z = [1, 2, 3, 4, 5]
		
			h = Hermit.new(a,b,n,y,z)
			
			expect(v.x).to eq [6, 6.5, 7, 7.5, 8]
		end
	end
end
