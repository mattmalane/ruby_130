=begin

Write a program that, given a natural number and a set of one or 
more other numbers, can find the sum of all the multiples of the 
numbers in the set that are less than the first number. If the set 
of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not 
including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18.
The sum of these multiples is 78.

**Rules/Requirements**

- given a natural number and a set of one or more other numbers
- find the sum of all multiples of the numbers in the set that are less than the first num
- if the set of numbers are not given, use default set of 3 and 5

**Examples**

20 ,[3, 5]
3, 5, 6, 9, 10, 12, 15, and 18
sum of above multiples => 78

**Data Structures**

iterate through a range

**Algorithm**

iterate through range from 1 up to not including integer arg
if the current num is a multiple of any of the numbers in the set
select the current num
sum the selected numbers
return the sum

we need a to class method
and
to instance method

we need a construtor
takes three args (set)
=end

class SumOfMultiples
  attr_reader :set

  def initialize(*numbers)
    @set = numbers
  end

  def to(num)
    (1...num).select do |integer|
      multiple?(integer)
    end.sum
  end

  def multiple?(int)
    set.any? {|num| int % num == 0}
  end

  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end
end
