=begin

Enumerable#one? processes elements in a collection by 
passing each element value to a block that is provided 
in the method call. If the block returns a value of true 
for exactly one element, then #one? returns true. Otherwise, 
#one? returns false. Note in particular that #one? will stop searching 
the collection the second time the block returns true.

**Rules/Requirements**

- process elements in a collection
- pass each element value to a block
- if block returns a value of true for exactly one element
  - then method returns true
- otherwise, method returns false
- method will stop searching the collection the second time the block returns true

**Examples**

one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
one?([1, 3, 5, 7]) { |value| true }           # -> false
one?([1, 3, 5, 7]) { |value| false }          # -> false
one?([]) { |value| true }                     # -> false

**Data Structures**

iterate through an array
yield to a block

**Algorithm**

iterate through the input array
pass each element value to a block
keep track of number of times the block returns true
if number of times is more than once, then return false
return true if count is at one

=end

def one?(array)
  count = 0
  array.each do |el|
    count += 1 if yield(el)
    return false if count > 1
  end
  count == 1 ? true : false
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false