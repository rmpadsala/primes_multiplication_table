# render module to render matrix multiplication table

module Test
  module Render
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def draw(matrix)
        raise "Invalid multiplication table" unless matrix.kind_of?(Array)

        padding = (Integer(matrix.first.last ** 2)).to_s.size
        output = ""
        matrix.each_with_index do |row, row_index|
          output << row.collect.with_index {
            |x, col_index| ((row_index == 0 && col_index == 0) ? " ".rjust(padding) : x.to_s.rjust(padding))
          }.join("|")
          output << "\n"
        end
        output
      end
    end
  end
end
