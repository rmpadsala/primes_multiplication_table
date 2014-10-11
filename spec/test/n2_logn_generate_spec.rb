require "spec_helper"

describe "N2LognGenerate" do
  describe ".instance_methods" do
    before do
      @object = Test::N2LognGenerate.new([])
    end

    it "should respond to instance_methods" do
      expect(@object).to respond_to(:matrix)
    end
  end

  describe ".matrix" do
    before do
      @object = Test::N2LognGenerate.new(
        [2,3,5,7])
    end

    it "should return correct multiplication table" do
      expected_matrix = [[4, 6, 10, 14], [6, 9, 15, 21], [10, 15, 25, 35], [14, 21, 35, 49]]
      expect(@object.matrix).to eq(expected_matrix)
    end
  end
end
