=begin

Write a program that takes a word and a list of possible anagrams and 
selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists",
"google", "inlets", and "banana", the program should return a list containing
"inlets". Please read the test
suite for the exact rules of anagrams.

**Rules/Requirements**

- program takes a word and alist of possible anagrams
- selects the correct sublist that contains the anagrams of the word
- what is an anagram?
  - all letters from the given word occur in another word. These two word are anagrams
**Examples**

'listen' ['enlists', 'google', 'inlets', 'banana']
=> ['inlets']

looking at test cases, the instantiated obj takes a string argument
the instance method match takes an array
match selects the strings from the given array

**Data Structures**

given word to match is a string
array of possible anagrams
store our results in an array

**Algorithm**

we need to create a class Anagram
new method takes a string
constructor assigns instance variable to string

match (instance method)
- takes an array argument
- iterate through the array
- if the current element is an anagram to the instance variable
- select the current element
- return list of anagrams

anagram?
- returns true if word and el are anagrams
- sort the chars of word and el
- if they are equal then they are anagrams

=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(arr)
    arr.select {|el| anagram?(el.downcase) }
  end

  def anagram?(el)
    return false if word == el
    word.chars.sort == el.chars.sort
  end
end

