=begin

Write a method called each_cons that behaves similarly for Arrays, 
taking the elements 2 at a time. The method should take an Array as 
an argument, and a block. It should yield each consecutive pair of 
elements to the block, 
and return nil.

Your method may use #each, #each_with_object, #each_with_index,
#inject, loop, for, while, or until to iterate through the Array 
passed in as an argument, but must not use any other methods that 
iterate through an Array or any other collection.

**Rules/Requirements**

- method takes elements 2 at a time
- method takes an array as arg, and a block
- yield each cons pair of elements to the block
- return nil

**Examples**

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

**Data Structures**

[] => {}

**Algorithm**

iterate through the collection
yield each cons pair of elements to the block
increment the first and second values by 1

=end

def each_cons(array)
  first = 0 
  second = 1

  loop do
    yield(array[first], array[second]) unless array.empty?
    first += 1
    second += 1
    break if second >= array.size
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }
p hash

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash #== {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil