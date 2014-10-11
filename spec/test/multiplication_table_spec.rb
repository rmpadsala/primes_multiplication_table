require "spec_helper"

describe "Multiplication Table" do
  describe ".class_methods" do
    it "should respond to class_methods" do
      expect(Test::MultiplicationTable).to respond_to(:prime?)
    end
  end

  describe ".instance_methods" do
    before do
      @object = Test::MultiplicationTable.new
    end

    it "should respond to instance_methods" do
      expect(@object).to respond_to(:no_of_primes)
    end

    it "should default no_of_primes to 5" do
      expect(@object.no_of_primes).to equal(10)
    end
  end

  describe ".collect(n)" do
    before do
      @object = Test::MultiplicationTable.new
    end

    it "should return prime numbers upto given n" do
      expect(Test::MultiplicationTable.collect(5)).to eq(
        [2, 3, 5, 7, 11])
      expect(Test::MultiplicationTable.collect(10)).to eq(
        [2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end
  end

  describe ".prime?(number)" do
    it "should correctly detect prime number" do
      expect(Test::MultiplicationTable.prime?(1)).to be false
      expect(Test::MultiplicationTable.prime?(2)).to be true
      expect(Test::MultiplicationTable.prime?(3)).to be true
      expect(Test::MultiplicationTable.prime?(7)).to be true
      expect(Test::MultiplicationTable.prime?(9)).to be false
      expect(Test::MultiplicationTable.prime?(12)).to be false
      expect(Test::MultiplicationTable.prime?(101)).to be true
    end
  end
end
