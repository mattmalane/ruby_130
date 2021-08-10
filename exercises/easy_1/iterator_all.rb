=begin

Enumerable#all? processes elements in a collection by 
passing each element value to a block that is provided 
in the method call. If the block returns a value of true 
for every element, then #all? returns true. Otherwise, #all? 
returns false. Note in particular that #all? will stop searching the 
collection the first time the block returns false.


**Rules/Requirements**

- process each element in a collection
- pass each element value to a block
- if block returns a value of true for every element
  - #all? returns true
- otherwise
  - #all stops processing and returns false

**Examples**

all?([1, 3, 5, 6]) { |value| value.odd? } => false

all?([1, 3, 5, 7]) { |value| value % 5 == 0 } => false

all?([2, 4, 6, 8]) { |value| value.even? } => true

**Data Structures**

iterate through an array
yield to a block

**Algorithm**

iterate through the input array
yield each element to the block
return false if false
return true at end of method

=end

def all?(array)
  array.each {|el| return false unless yield(el)}
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true