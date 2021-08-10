=begin

**Rules/Requirements**

- implement octal to decimal conversion
- given an octal input string, program should produce
  a decimal output
- treat invalid input as octal 0

**Examples**

looking at test cases, we need to create an Octal class
new method takes a string representation of an integer as the argument
there is a to_decimal instance method that converts the octal num to a decimal num

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

the rightmost digit is multiplied by 8 to the power of 0

**Data Structures**

string
integers
array of digits

**Algorithm**

given an integer as a string
convert string to integer, then to an array of digits
multiply the first digit by 8 to the power of 0
multiply the second digit by 8 to the power of 1
multiply the third digit by 8 to the power of 2
repeat untill all digits have been multiplied
add all multiplied digits together

=end

class Octal
  attr_reader :numbers

  def initialize(str)
    @numbers = str
  end

  def to_decimal
    return 0 if invalid?
    nums = numbers.to_i.digits
    results = []
    n = 0

    loop do
      results << nums[n] * (8**n)
      n += 1
      break if n == nums.size
    end
    results.sum
  end

  def invalid?
    numbers =~ /[a-zA-Z]|[8-9]/ 
  end
end

p Octal.new("233abc").to_decimal
