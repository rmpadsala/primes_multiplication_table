# HalfN2Generate class generates complete multiplication table
# Running time for this method is O(N^2)
module Test
  class N2Generate
    def initialize(prime_ary)
      @prime_ary = prime_ary
    end

    def matrix
      @prime_ary.map.with_index { |x,i| @prime_ary.map.with_index { |y| x * y } }
    end
  end
end
