=begin

The diamond exercise takes as its input a letter, and 
outputs it in a diamond shape. Given a letter, it prints
a diamond starting with 'A', with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

**Rules/Requirements**

- takes a letter an input
- outputs a diamond shape
- the letter is in the diamond at the widest point
- input: str (letter)
- output: str (diamond)
- we know that the input letter is at the widest point
- the diamond starts at the first line, always with the beginning of the alphabet
- the diamond always ends with the beginning of the alphabet
- the output of one line of the diamond consists of spaces and two letters
- first half of the diamond is a triangle, with height and width the same

**Examples**

'A'

A

'C'

  A
 B B
C   C
 B B
  A

given 'C' the diamond starts at 'A'
input it 'C' the diamond is going to be 5X5


'E' => input letter


    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A

row length is 9
we need to keep track of spaces outside
  - spaces outside will decrement for the first half of the triangle
and spaces on the inside
  - spaces inside will increment for the first half of the triangle

space outside? => will change depending on the size of the widest row
  - size of the array - 1
  - decreases by 1 for every row

spaces inside? => always starts at 1 for the letter "B"
  - increments by 2 for every row


**Data Structures**

string
we need to output strings to make the total output look like a diamond

**Algorithm**

First half of the triangle

create an array with letters 'A' to the input array
determine the size of the widest row
determine the size of outside spaces
  - size of array -1
set inside spaces to 0
iterate through the array of letters

if letter is 'A' then output outside spaces, the current letter once, and outside spaces
  decrease outside spaces by 1
  increase inside spaces by 1 (only for the letter A)
otherwise
  output outside spaces, the current letter, inside spaces, the current letter, outside
  decrease outside spaces by 1
  increase inside spaces by 2

last half of the triangle

reverse the array
iterate through letters not including the input letter
if letter is not 'A'
  increase outside spaces by 1
  decrease inside spaces by 2
  output outside spaces, the current letter, inside spaces, the current letter, outside
else
  decrease outside spaces by 1
  increase inside spaces by 1
  output outside spaces, the current letter once, and outside spaces


=end

class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a
    widest_row = letters.size
    outside_spaces = widest_row - 1
    inside_spaces = 0
    results = []

    letters.each do |letter|
      if letter == 'A'
        results << "#{" " * outside_spaces}" + letter + "#{" " * outside_spaces}"
        outside_spaces -= 1
        inside_spaces += 1
      else
        results << "#{" " * outside_spaces}" + letter + "#{" " * inside_spaces}" +
                    letter + "#{" " * outside_spaces}"
        outside_spaces -= 1
        inside_spaces += 2
      end
    end

    inside_spaces -= 2
    outside_spaces += 1

    letters.reverse[1..-1].each do |letter|
      if letter != 'A'
        outside_spaces += 1
        inside_spaces -= 2
        results << "#{" " * outside_spaces}" + letter + "#{" " * inside_spaces}" +
                    letter + "#{" " * outside_spaces}"
      else
        outside_spaces += 1
        inside_spaces -= 1
        results << "#{" " * outside_spaces}" + letter + "#{" " * outside_spaces}"
      end
    end
    results.join("\n") + "\n"
  end
end

# p Diamond.make_diamond('E')

# class Diamond
#   def self.make_diamond(letter)
#     range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
#     diamond_width = max_width(letter)

#     range.each_with_object([]) do |let, arr|
#       arr << make_row(let).center(diamond_width)
#     end.join#("\n") + "\n"
#   end

#   private

#   def self.make_row(letter)
#     return "A" if letter == 'A'
#     return "B B" if letter == 'B'

#     letter + determine_spaces(letter) + letter
#   end

#   def self.determine_spaces(letter)
#     all_letters = ['B']
#     spaces = 1

#     until all_letters.include?(letter)
#       current_letter = all_letters.last
#       all_letters << current_letter.next
#       spaces += 2
#     end

#     ' ' * spaces
#   end

#   def self.max_width(letter)
#     return 1 if letter == 'A'

#     determine_spaces(letter).count(' ') + 2
#   end
# end

p Diamond.make_diamond('E')