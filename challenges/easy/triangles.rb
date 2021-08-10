=begin

Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, 
and the sum of the lengths of any two sides must be greater than the length 
of the third side.

**Rules/Requirements**

- program determines triangle type (equilateral, isosceles, or scalene)
- equilateral; all three sides same length
- isosceles; two sides same length
- scalane; all sides of different lengths.
- valid triangles must have all sides with a length greater than 0 and
  - sum of lengths of any two sides must be greater than the length of the third side

**Examples**

looking at the test cases, we need an instance method `kind`
we also need to raise an ArgumentError if the input integers do not meet the requirements
of a valid triangle.

**Data Structures**

we will work with integers to determine valid triangles and type of triangles
each side (integer) will be held in an array

**Algorithm**

we need to create a triangle class
this class will have a constructor method that initializes
the instance variable sides to the integer values assigned to the parameters of the method
inside the constructor method, we will raise an ArgumentError unless the sides
meet the requirements of a valid triangle

once we intialize instance variable sides and determine if the triangle is valid,
then we can move on to the instance method kind;
determines the triangle type;
equilateral
isosceles
scalene

kind (instance method)

if all three sides are the same length then return the string
  'equilateral'
if two sides are the same length then return the string
  'isosceles'
otherwise return the string
  ' scalene'

valid_triangle?
  all sides must be greater than 0
  sum of lengths of any two sides must be greater than the length of the third side

=end

class Triangle
  attr_reader :sides

  def initialize(*sides)
    @sides = sides
    raise ArgumentError unless valid_triangle?
  end

  def kind
    if sides.all? {|side| side == sides[0]}
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  def valid_triangle?
    sides.all? {|side| side > 0} &&
    (sides[0] + sides[1] > sides[2]) &&
    (sides[0] + sides[2] > sides[1]) &&
    (sides[1] + sides[2] > sides[0])
  end
end