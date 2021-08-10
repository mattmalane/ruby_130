=begin

Write a method that takes a sorted array of integers as an argument, and 
returns an array that includes all of the missing integers (in order) 
between the first and last elements of the argument.

**Rules/Requirements**

- method takes a sorted array of integers
- returns an array that includes all of missing integers (in order)
  - between first and last elements of the argument
- Input: array of integers
- output: array of integers
- What is a missing integer?

**Examples**

[-3, -2, 1, 5] => [-1, 0, 2, 3, 4]
missing numbers between -3 and 5 in the array are [-1, 0, 2, 3, 4]


[1, 5] => [2, 3, 4]
missing numbers between 1 and 5 are 2, 3, 4

**Data Structures**

range of numbers between first and last element of argument array
array of numbers in the range from above

**Algorithm**

find all cons pairs of numbers
find missing numbers between each pair
store missing numbers in a result array

1. initialize local variable and assign it to an empty array
2. return new array of consecutive pairs
3. iterate through cons pairs
  - for each pair, append a range of numbers between, not including
  the first and last elemnent of the range
4. return the array

=end

def missing(array)
  results = []

  array.each_cons(2).to_a.each do |pair|
    results << ((pair[0] + 1)...(pair.last)).to_a
  end
  results.flatten
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []