# N2LognGenerate class generates multiplication recursively using devide and conquer method
# at each iteration prime_ary input is devided in half. On Last iteration multiplication
# table for individual elements are generated independently. For large number of primes
# we can offload multiplication table generation taks for each element to seperate thread/process and
# design scalable solution

# Running time for this method is O(N^2 logN). We can improve this method by generating only upper
# half of multiplication method and reduce complexity to O(1/2 N^2 logN). Though either of the approach
# is slower because of recursion and time complexity, it can scale better than other iterative approaches
module Test
  class N2LognGenerate

    def initialize(prime_ary)
      @prime_ary = prime_ary
      @matrix = []
    end

    # returns 2d array of complete primes multiplication table matrix
    def matrix
      generate_recursive(0, @prime_ary.size-1)
      @matrix
    end

    private
      # recursivesly generate array
      def generate_recursive(low, high)
        if (low >= high)
          generate_multiplication_table(low)
          return
        end
        mid = low  + (high - low)/2
        generate_recursive(low, mid)
        generate_recursive(mid+1, high)
      end

      # possibly this method can be off loaded to individual thread/process
      # for scalability
      def generate_multiplication_table(element_index)
        temp_ary = []
        for index in 0...@prime_ary.size
          temp_ary << @prime_ary[element_index] * @prime_ary[index]
          index += 1
        end
        @matrix << temp_ary
      end
  end
end
