=begin

Write a method to find the 5th largest element in an array of unsorted integers.

=end

require "rspec/autorun"

def fifth_largest(int_arr)
  return nil if int_arr == nil
  return nil if int_arr.size < 5
  return int_arr.sort[-5]
end

RSpec.describe "fifth_largest:" do

  context "empty array:" do
    it "returns nil" do
      expect(fifth_largest(nil)).to eq(nil)
    end
  end

  context "array has less than 5 elements:" do
    it "returns nil" do
      expect(fifth_largest([1,2,3])).to eq(nil)
    end
  end

  context "array has 5 unique elements unsorted:" do
    it "returns the 5th largest element" do
      expect(fifth_largest([4,5,2,3,6])).to eq(2)
    end
  end

  context "array's larger elements are not unique:" do
    it "returns the 5th largest element" do
      expect(fifth_largest([8,7,8,6,5])).to eq(5)
    end
  end

  context "5th largest element is not unique:" do
    it "returns the 5th largest element" do
      expect(fifth_largest([12,10,14,20,12,16,12,22])).to eq(12)
    end
  end

  context "array is large:" do
    int_arr = []
    for i in 1..10000
      int_arr << 10000 - i
    end
    it "returns the 5th largest element" do
      expect(fifth_largest(int_arr)).to eq(9995)
    end
  end

  context "array is all negative ints:" do
    it "returns the fifth largest element" do
      expect(fifth_largest([-10,-8,-12,-6,-4,-20])).to eq(-12)
    end
  end

  context "array contains mix of positive and negative integers:" do
    it "returns the fifth largest element" do
      expect(fifth_largest([-1,1,-3,4,-6,8])).to eq(-3)
    end
  end

end
