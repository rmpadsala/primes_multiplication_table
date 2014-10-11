# render module to render matrix multiplication table

module Test
  module Render
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def draw(matrix, draw_mirror=false)
        raise "Invalid multiplication table" unless matrix.kind_of?(Array)

        padding = (Integer(matrix.first.last ** 2)).to_s.size
        draw_mirror ? draw_mirror(matrix, padding) : draw_full(matrix, padding)
      end

      # render full matrix and return output as a string
      def draw_full(matrix, padding)
        output = ""
        matrix.each_with_index do |row, row_index|
          output << row.collect.with_index {
            |x, col_index| ((row_index == 0 && col_index == 0) ? " ".rjust(padding) : x.to_s.rjust(padding))
          }.join("|")
          output << "\n"
        end
        output
      end

      # method to first create lower half of matrix from upper half and then render full matrix
      # returns output as a string
      def draw_mirror(matrix, padding)
        padding = (Integer(matrix.first.last ** 2)).to_s.size
        for row_index in 0...matrix.size
          temp_ary = []
          for col_index in 0...matrix.size
            if (col_index < row_index)
              temp_ary << matrix[col_index][row_index]
            else
              temp_ary += matrix[row_index]
              break
            end
            col_index += 1
          end
          matrix[row_index] = temp_ary
          row_index += 1
        end
        draw_full(matrix, padding)
      end
    end
  end
end
