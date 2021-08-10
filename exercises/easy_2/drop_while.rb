=begin

Write a method called drop_while that behaves similarly for Arrays. 
It should take an Array as an argument, and a block. It should 
return all the elements of the Array, except those elements 
at the beginning of the Array that 
produce a truthy value when passed to the block.

**Rules/Requirements**

- takes an array as an arguments and a block
- returns all elements of the array except those elements at the beginning of the array
  that produce a truthy value when passed to the block
- input: array
- output: array

**Examples**

drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
1.odd? is true, 5.odd? is true, 6.odd? is false, so return false and rest of the array

drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
1.even? is false, so return the element that resulted in false and the rest of the array

**Data Structures**

[] => []

**Algorithm**

iterate through the input array
yield each element to the block
if the block returns false, then return the current element and the rest of the array
if the block returns true, then keep iterating

=end

def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end
  array[index..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []