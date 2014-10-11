module Test
  module Prime
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def prime?(number)
        number = Integer(number)
        return false if number < 2

        div = (2..Math.sqrt(number).to_i)
        div.select { |d| number % d == 0 }.empty?
      end

      def collect(limit)
        limit = Integer(limit)
        return [2] if limit == 1

        range = 2...limit**2
        range.select { |i| prime? i }.first(limit)
      end
    end
  end
end
