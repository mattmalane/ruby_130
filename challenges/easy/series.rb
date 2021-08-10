=begin

**Rules/Requirements**

- program takes a string of digits
- returns the possible consecutive  number series of a specified length in that string
- if you ask for a 6 digit series from a 5 digit string, you should throw an error
- input: string
- output: array

**Examples**

For example, the string "01234" has the following 3-digit series:

012
123
234

Likewise, here are the 4-digit series:

0123
1234

**Data Structures**

string of digits
we need to return an array of integers

**Algorithm**

we need a class Series
objs instantiated from the Series class will take a string of digits
the constructor will initialize instance variable series to the string of digits given

we also need an instance method slices.
this method takes an integer, representing the specified length of cons number series
that need to be returned.
this method also raises an ArgumentError is the integer argument is greater than
length of series

slices
- takes an integer (length)
- convert string of digits into an array of digits
- find each cons (length) integers and save them to an array
- return the array

=end

class Series
  attr_reader :series

  def initialize(series)
    @series = series
  end

  def slices(num)
    raise ArgumentError if num > series.length
    results = []
    digits = series.chars.map(&:to_i)
    digits.each_cons(num) {|serie| results << serie}
    results
  end
end