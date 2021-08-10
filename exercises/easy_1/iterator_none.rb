=begin

Enumerable#none? processes elements in a collection 
by passing each element value to a block that is 
provided in the method call. If the block returns true 
for any element, then #none? returns false. Otherwise, 
#none? returns true. Note in particular that #none? will stop searching the 
collection the first time the block returns true.

**Rules/Requirements**

- process elements in arg
- pass each element value to a block
- if block returns true for any element
  - then method returns false
- otherwise
  - return true
- method will stop searching the collection the first time the block returns true.

**Examples**

none?([1, 3, 5, 6]) { |value| value.even? } => false
none?([1, 3, 5, 7]) { |value| value.even? } => true

**Data Structures**

iterate through an array
yield to a block

**Algorithm**

iterate through the arg array
yield each element to the block
if block returns true
  - method returns false
othewise
  return true

=end

def none?(array)
  array.each {|el| return false if yield(el)}
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true