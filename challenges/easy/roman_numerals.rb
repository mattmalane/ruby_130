=begin

Write some code that converts modern decimal numbers into their Roman number equivalents.

**Rules/Requirements**

- convert modern decimal numbers into their roman number equivalents
- romans wrote numbers using letters = I, V, X, L, C, D, M
- no need to convert numbers larger than about 3000
- roman numberals are written by expressing each digit separately starting with the
  left most digit and skipping any digit with a value of zero
- input: integer
- output: string ( roman numerals )

**Examples**

1  => I
10  => X
7  => VII

1990 => MCMXC
1000 => M
900 => CM
90 => XC

2008 => MMVIII
2000 => MM
8 => VIII

**Data Structures**

hash
{1 => "I",
 5 => "V",
 10 => "X",
 50 => "L",
 100 => "C",
 500 => "D",
 1000 => "M",
}

**Algorithm**

initialize empty string

=end

class RomanNumeral
  CONVERSION = {1000 =>"M", 900 => "CM", 500 =>"D", 400 => "CD", 100 =>"C",
                90 => "XC", 50 =>"L", 40 => "XL", 10 =>"X", 9 => "IX", 
                5 =>"V", 4 => "IV", 1 =>"I"}

  attr_reader :non_roman

  def initialize(non_roman)
    @non_roman = non_roman
  end

  def to_roman
    roman_version = ''
    to_convert = non_roman

    CONVERSION.each do |key, value|
      multiplier, remainder = to_convert.divmod(key)
      if multiplier > 0
        roman_version += (value * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end

roman = RomanNumeral.new(2550)
p roman.to_roman