=begin

Write a method called each_with_object that behaves similarly for Arrays. 
It should take an Array and an object of some sort as an argument, and a block. 
It should yield each element and the object to the block. each_with_object 
should return the final value of the object.

If the Array is empty, each_with_object should return the original object
passed as its second argument.

Your method may use #each, #each_with_index, #inject, loop, for, while, or 
until to iterate through the Array passed in as an argument, but must not use 
any other methods that iterate through an Array or any other collection.

**Rules/Requirements**

- method takes an array and an object of some sort, and a block
- yield each element and the object to the block
- returns the final value of the object
- if array is empty, return the original object passed as its second arg
- input: array, obj
- output: obj

**Examples**

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
result == [1, 9, 25]

**Data Structures**

[] {}

**Algorithm**

iterate through the array arg
set obj to local variable
yield each element and obj to the block
return obj

=end

def each_with_object(array, obj)
  array.each do |el|
    yield(el, obj)
  end
  obj
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}