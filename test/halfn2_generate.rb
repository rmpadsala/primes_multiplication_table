# HalfN2Generate class to generate primes multiplication table
# Running time for this method is O(1/2 N^2)
module Test
  class HalfN2Generate

    def initialize(prime_ary)
      @prime_ary = prime_ary
    end

    # returns 2d array of primes multiplication table matrix. While iterating
    # Matrix lower half is constructed from the upper half.
    def matrix
      twod_ary = []
      for i in 0...@prime_ary.size
        # create row array
        twod_ary[i] = Array.new if twod_ary[i].nil?
        for j in i...@prime_ary.size
          twod_ary[i] << @prime_ary[i] * @prime_ary[j]
          if (j > i)
            # create lower half of multiplication table
            twod_ary[j] = Array.new if twod_ary[j].nil?
            twod_ary[j] << @prime_ary[i] * @prime_ary[j]
          end
        end
      end
      twod_ary
    end
  end
end
