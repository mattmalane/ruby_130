=begin

**Rules/Requirements**

- program computes the scrabble score for that word
- given a word
- sum the values of all the tiles used in each word

**Examples**

- CABBAGE is worth 14 points
  - 3 points for C
  - 1 point for A (two)
  - 3 points for B (two)
  - 2 points for G
  - 1 point for E

**Data Structures**

Hold the tiles as keys in a hash with their points as values

**Algorithm**

we need to create a Scrabble class
- scrabble obj takes a word arg upon instantiation
score (instance method)
- we need to take the string assigned to the word instance variable
- for each letter in the word
- increment a score for each letter
- return the score

=end

class Scrabble
  LETTER_SCORES = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }

  attr_reader :word

  def initialize(word)
    @word = word ? word : ''
  end

  def score
    points = 0
    word.chars.each do |letter|
      LETTER_SCORES.each do |letters, values|
        points += values if letters.include?(letter.upcase)
      end
    end
    points
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end