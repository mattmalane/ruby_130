=begin

The Array#zip method takes two arrays, and combines 
them into a single array in which each element is a 
two-element array where the first element is a value 
from one array, and the second element is a value from 
the second array, in order. For example:

[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

Write your own version of zip that does the same type of operation. 
It should take two Arrays as arguments, and return a new Array 
(the original Arrays should not be changed). Do not use the 
built-in Array#zip method. You may assume that both 
input arrays have the same number of elements.

**Rules/Requirements**

- should take two arrays as args
- return a new array
- both input arrays have the same number of elements
- the first element is a value from one array,
- the second element is a value from the second array.

**Examples**

[1, 2, 3] [4, 5, 6] => [[1, 4], [2, 5], [3, 6]]
take the elements at index 0 from both and store in an array
take the elements at index 1 from both and store in an array
take the elemnets at index 2 from both and store in an array


**Data Structures**

two arrays => one nested array


**Algorithm**

keep track of an index
store the elements at current index from both arrays into an array
increment index
repeat steps untill the index reaches size of array

=end

def zip(arr1, arr2)
  idx = 0
  results = []

  loop do
    results << [arr1[idx], arr2[idx]]
    idx += 1
    break if idx == arr1.size
  end

  results
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]