require 'minitest/autorun'

class TestBoolean < Minitest::Test
  
  def test_odd?
    value = 1
    assert_equal(true, value.odd?)
  end
end