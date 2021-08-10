=begin

Write a program that can calculate the Hamming distance between two DNA strands.

By counting the number of differences between two homologous DNA strands taken 
from different genomes with a common ancestor, we get a measure of the minimum 
number of point mutations that could have occurred on the evolutionary path 
between the two strands.

This is called the Hamming distance.

**Rules/Requirements**

- program calculates the hamming distance between two DNA strands.
- hamming distance is the number of difference between two homologous DNA strands
- hamming distance is only defined for sequences of equal lengths.
  - compute hamming distance over the shorter length if unequal lengths
**Examples**

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. 
If you have two sequences of unequal length, you should compute 
the Hamming distance over the shorter length.

**Data Structures**

we can use a string to hold the value of DNA strands

**Algorithm**

create a class DNA
we need a constructor that will initialize instance variable strand

create an instance method hamming_distance(string)
method takes a string argument
iterate through the strand instance variable and the input argument string
if the current elements are not the same
incremenet a counter
method returns the integer value assigned to counter

What if the DNA strands are of unequal length?
  - we need to calculate the hamming_distance over the shorter DNA strand
  - helper method that find the length of the shortest DNA strand
    - we can use this length for a break point in our iteration
    - i.e stop iterating when the index is greater than the break point

how do i compare which str is shorter?
  save the length of the shorter string
=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(str)
    shortest_length = strand.length > str.length ? str.length : strand.length
    counter = 0
    idx = 0
    
    while idx < shortest_length
      counter += 1 unless strand[idx] == str[idx]
      idx += 1
    end

    counter
  end
end