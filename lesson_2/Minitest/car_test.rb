require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class Cartest < MiniTest::Test
  def test_wheels # assert_equal
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip
    car = Car.new
    assert_equal(3, car.wheels)
  end
  
  def test_car_exists # assert
    car = Car.new
    assert(car)
  end

  def test_name_is_nil # assert_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg # assert_raises
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")
    end
  end

  def test_instance_of_car # assert_instance_of
    car = Car.new
    assert_instance_of(Car, car)
  end

  def test_includes_car # assert_includes
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end
end