=begin

Write a function to remove all characters from the string that are present in
another string called filter.

=end

require "rspec/autorun"

def filter_string(str, filter)
  return str.split("").delete_if{|ch| filter.downcase.split("").include?(ch.downcase)}.join
end

RSpec.describe "filter_string" do

  context "filter doesn't contain any characters in string" do
    it "leaves string unchanged" do
      expect(filter_string("foo", "b")).to eq("foo")
    end
  end

  context "filter is one character that is present in string" do
    it "removes filter char from string" do
      expect(filter_string("foo", "f")).to eq("oo")
    end
  end

  context "filter is two chars present contiguously in same order in string" do
    it "removes the two chars from string" do
      expect(filter_string("Buck", "ck")).to eq("Bu")
    end
  end

  context "filter contains multiple characters randomly present in string one or multiple times" do
    it "removes all instances of all filter chars from string" do
      expect(filter_string("random string", "mnqr")).to eq("ado stig")
    end
  end

  context "filter contains lowercase characters whose uppercase equivalents are in string" do
    it "removes filter characters from string regardless of case" do
      expect(filter_string("RaNdOm StRiNg", "rnqm")).to eq("adO Stig")
    end
  end

end

=begin
class TestFilterString < Test::Unit::TestCase

  def test_disjoint
    assert_equal(filter_string("foo", "b"), "foo")
  end

  def test_one_char
    assert_equal(filter_string("foo", "f"), "oo")
  end

  def test_two_char
    assert_equal(filter_string("buck", "bu"), "ck")
  end

  def test_random_char
    assert_equal(filter_string("random string", "rnm"), "ado stig")
  end

  def test_case_insensitive
    assert_equal(filter_string("RaNdOm StRiNg", "rnm"), "adO Stig")
  end

end
=end
