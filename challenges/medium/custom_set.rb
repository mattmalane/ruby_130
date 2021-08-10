=begin

Create a custom set type.

Sometimes it is necessary to define a custom data structure of some type, like a set.
In this exercise you will define your own set type. How it works internally 
doesn't matter, as long as it behaves like a set of unique elements that can 
be manipulated in several well defined ways.

In some languages, including Ruby and JavaScript, there is a built-in Set type. 
For this problem, you're expected to implement your own custom set type. 
Once you've reached a solution, feel free to play around with using the built-in 
implementation of Set.

For simplicity, you may assume that all elements of a set must be numbers.


**Rules/Requirements**

- create a custom set type
- assume all elements of a set must be numbers
- custom set; set of unique elements that can be manipulated in several well defined ways

**Example**

looking at the test suite, we need a CustomSet class
in this class we have a constructor
instantiated objects take an array argument
instance variable assigned to the array

instance methods;
empty?
contains?(num)
subset?(other_object)
disjoint?(other_object)
eql?(other_object)
add(num)
intersection(other_object)
difference(other_object)
union(other_object)

**Data Structures**

we can use an array for our customs set

**Algorithm**

we need a class CustomSet
intantiated objects take an array, if no arg, default to an empty array
constructor sets the set to the array parameter

instance methods;

empty?
- returns true if the set array is empty, false otherwise
contains?(num)
- returns true if the arg is included in the set
subset?(other_object)
- returns true if all integers from the calling objects set occur in the argument set
- [1, 2].subset?[1, 2, 3] => true
  - does 1 occur in [1, 2, 3]
  - does 2 occur in [1, 2, 3]
disjoint?(other_object)
- returns true if all integers from the calling objects set do not occur in the argument set
eql?(other_obj)
- returns true if all of the integers from the calling object occur in the argument set
add(num)
- appends num argument to the set of the calling object if num does not already exist
  in the set of the calling object
intersection(other_object)
- returns a new cutomset obj with a set of the shared elements from calling and arg set
difference(other_object)
- returns a new customset obj
union(other_object)
- returns a new customset obj
- combines the set of calling object and set of argument obj
- does not include duplicate numbers

=end

class CustomSet
  attr_reader :set

  def initialize(set=[])
    @set = set.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end
  
  def subset?(other)
    set.all? {|num| other.set.include?(num)}
  end

  def disjoint?(other)
    set.none? {|num| other.set.include?(num)}
  end

  def eql?(other)
    return false unless set.length == other.set.length
    set.all? {|num| other.contains?(num)}
  end

  def ==(other)
    eql?(other)
  end

  def add(num)
    set << num unless set.include?(num)
    CustomSet.new(set)
  end

  def intersection(other)
    same_elements = set.select {|el| other.contains?(el)}
    CustomSet.new(same_elements)
  end

  def difference(other)
    results = set.difference(other.set)
    CustomSet.new(results)
  end

  def union(other)
    results = set.union(other.set).sort
    CustomSet.new(results)
  end
end