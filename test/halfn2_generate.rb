# HalfN2Generate class generates only upper half of the multiplication table
# lower half is rendered while drawing. Running time for this method is O(1/2 N^2)
# Note: this method requires additional work while rendring as we have to generate
# lower half while rending
module Test
  class HalfN2Generate

    def initialize(prime_ary)
      @prime_ary = prime_ary
    end

    def matrix
      twod_ary = []
      for i in 0...@prime_ary.size
        temp = []
        for j in i...@prime_ary.size
          temp << @prime_ary[i] * @prime_ary[j]
        end
        twod_ary << temp
      end
      twod_ary
    end
  end
end
