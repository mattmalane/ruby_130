=begin

Write a method called each_with_index that behaves similarly for Arrays. 
It should take an Array as an argument, and a block. It should yield each
element and an index number to the block. each_with_index should 
return a reference to the original Array.

Your method may use #each, #each_with_object, #inject, loop, for, 
while, or until to iterate through the Array passed in as an argument, 
but must not use any other methods that iterate through an Array or 
any other collection.

**Rules/Requirements**

- method takes an array as arg and a block
- yield each element and an index number to the block
- return a reference to the original array
- input: array
- output: reference to the original array

**Examples**

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

0 -> 1
1 -> 3
2 -> 36
true

**Data Structures**

[]

**Algorithm**



=end

def each_with_index(array)
  idx = 0
  array.each do |el|
    yield(el, idx)
    idx += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]


