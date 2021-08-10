=begin

Write a method called max_by that behaves similarly for Arrays. 
It should take an Array and a block, and return the element that 
contains the largest value.

If the Array is empty, max_by should return nil.

**Rules/Requirements**

- method takes an array and a block
- returns the element that contains the largest value
- input: array
- output: element with largest value
- how do we find the largest value returned by the block?
  - store block return values? then find the largest?

**Examples**

max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]

**Data Structures**

[]

**Algorithm**

iterate through the array
yield each element to the block
store each return value of the block in an array
return the largest return value from the array

=end

def max_by(array)
  return nil if array.empty?

  max_element = array.first
  largest = yield(max_element)

  array[1..-1].each do |item|
    yielded_value = yield(item)
    if largest < yielded_value
      largest = yielded_value
      max_element = item
    end
  end

  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } #== 5
p max_by([1, 5, 3]) { |value| 9 - value } #== 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil