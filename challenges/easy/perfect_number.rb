=begin

**Rules/Requirements**

- aliquot sum is the sum of a numbers positive divisors
- perfect; aliquot sum that is equal to the original number
- abundant; aliquot sum that is greater than the original number
- deficient; aliquot sum that is less than the original number
- write a program that can tell whether a number is perfect, abundant, or deficient

**Examples**

6 => perfect
divisors; 1, 2, 3 => 6
6 == 6

**Data Structures**

integers
array of divisors so we can sum the whole array

**Algorithm**

we need a `PerfectNumber` class
we need a class method `classify`
this method takes a number
returns a string (perfect, abundant, deficient)
raise a StandarError if the integer argument is less than 0

classify
- given an integer
- find divisors of the integer
- sum the divisors
- if sum is equal to integer
  return the string 'perfect'
  if sum is greater than integer
  return the string 'abundant'
  if sum is less than integer
  return the string deficient

=end

class PerfectNumber
  def self.classify(num)
    raise StandarError if num < 0
    divisors = []
    (1..num).to_a.each do |divisor|
      divisors << divisor if num % divisor == 0 && num != divisor
    end
    
    if divisors.sum == num
      'perfect'
    elsif divisors.sum > num
      'abundant'
    else
      'deficient'
    end
  end
end
