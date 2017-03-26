=begin

Write a function to remove all characters from the string that are present in
another string called filter.

=end

require "test/unit"

def filter_string(str, filter)
  return str.split("").delete_if{|ch| filter.split("").include?(ch)}.join
end

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

end
