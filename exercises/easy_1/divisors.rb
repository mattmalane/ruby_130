=begin

Write a method that returns a list of all of the divisors of 
the positive integer passed in as an argument.
The return value can be in any sequence you wish.

**Rules/Requirements**

- method returns a list of all divisors of the positive integer passed in as arg
- retun value can be any sequence
- input: integer
- ouput: array of integers

**Examples**

1 => 1
7 => [1, 7]
12 => [1, 2, 3, 4, 6, 12]

**Data Structures**

[]

**Algorithm**

iterate through a range of number 1 through input arg
if the int arg mod current number is equal to zero,
add current num to a results array

=end

def divisors(num)
  results = []
  (1..num).to_a.each {|int| results << int if num % int == 0}
  results
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute