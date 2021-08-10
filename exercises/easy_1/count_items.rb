=begin

Write a method that takes an array as an argument, and a 
block that returns true or false depending on the value of 
the array element passed to it. The method should return a 
count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

**Rules/Requirements**

- method takes an array as arg
- method takes a block that returns true or false
  - depending on value of the array element passed to it
- method returns a count of the number of times the block returns true

**Examples**

count([1,2,3,4,5]) { |value| value.odd? } => 3
count([1,2,3,4,5]) { |value| true } => 5
count([1,2,3,4,5]) { |value| false } => 0

**Data Structures**

iterate through an array
yield each element to the block

**Algorithm**

iterate through the array argument
yield each element to the block
increment a counter each time the block returns true
return the counter

=end

def count(array)
  true_count = 0
  array.each {|el| true_count += 1 if yield(el)}
  true_count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2