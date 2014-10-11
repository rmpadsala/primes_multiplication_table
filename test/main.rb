# PrimesMultiplicationTable.new(options[:size]).render

require 'optparse'
require_relative "multiplication_table"

module Test
  class OptParser

    def self.parse(args)
      options = OpenStruct.new
      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: main.rb [options]"

        opts.separator ""
        opts.separator "Specific options:"

        opts.on("-n", "--number NO_OF_PRIMES",
                "Number of primes to be used for multiplication table") do |n|
          options.number_of_primes = n
        end

        opts.separator ""
        opts.separator "Common options:"

        opts.on_tail("-h", "--help", "Display Usage") do
          puts opts
          exit
        end
      end

      opt_parser.parse!(args)
      options
    end  # parse()

  end
end

options = Test::OptParser.parse(ARGV)
Test::MultiplicationTable.new(options.number_of_primes).draw
