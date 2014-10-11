module Test
  module Prime
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      # returns true if number is prime otherwise false
      def prime?(number)
        number = Integer(number)
        return false if number < 2

        div = (2..Math.sqrt(number).to_i)
        div.select { |d| number % d == 0 }.empty?
      end

      # returns an array of primes for supplied limit
      def collect(limit)
        limit = Integer(limit)
        return [2] if limit == 1

        prime_numbers = []
        prime_index = 0

        while prime_numbers.length != limit
          prime_index = next_prime(prime_index)
          prime_numbers << prime_index
        end
        prime_numbers
      end

      # returns next prime number
      def next_prime(n)
        prime_number = n + 1
        while prime?(prime_number) == false
          prime_number += 1
        end
        return prime_number
      end
    end
  end
end
