require_relative "app_consts"
require_relative "prime"
require_relative "render"
require_relative "n2_generate"
require_relative "halfn2_generate"
require_relative "n2_logn_generate"

module Test
  class MultiplicationTable
    include Prime
    include Render

    attr_accessor :no_of_primes

    def initialize(no_of_primes=Test::Constants::DEFAULT_NO_OF_PRIMES)
      @no_of_primes = no_of_primes || Test::Constants::DEFAULT_NO_OF_PRIMES
    end

    def draw
      begin
        # # method - 1: Time Complexity O(N^2)
        # matrix = N2Generate.new(collect).matrix
        # print self.class.draw(matrix)

        # # method - 2: Time Complexity O(1/2 N^2)
        # matrix = HalfN2Generate.new(collect).matrix
        # print self.class.draw(matrix)

        # # method - 3: Recursive Time Complexity O(N^2 log N)
        matrix = N2LognGenerate.new(collect).matrix
        print self.class.draw(matrix)

      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end
    end

    private

      def collect
        [1] + self.class.collect(no_of_primes)
      end
  end
end
