=begin

Write a method called count that behaves similarly for an arbitrarily 
long list of arguments. It should take 0 or more arguments and a block, 
and then return the total number of arguments for which the block returns true.

**Rules/Requirements**

- method takes 0 or more arguments and a block
- returns the total number of arguments for which the block returns true
- input: 0 or more integers
- output: integer

**Examples**

count(1, 3, 6) { |value| value.odd? } => 2
count(1, 3, 6) { |value| value.even? } => 1

**Data Structures**

[]
iterate through an array of args

**Algorithm**

iterate through an array of args
yield each element to the block
count each return value of true

=end

def count(*args)
  count = 0
  args.each {|num| count += 1 if yield(num)}
  count
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3