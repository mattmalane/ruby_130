=begin

The following list contains the names of individuals who are 
pioneers in the field of computing or that have had a 
significant influence on the field. The names are in an encrypted form, though, 
using a simple (and incredibly weak) form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names .

ROT13 replaces each letter by its partner 13 characters 
further along the alphabet. For example, HELLO becomes 
URYYB (or, conversely, URYYB becomes HELLO again).



**Rules/Requirements**

- ROT13 replaces each letter by its partner 13 characters further along the alphabet
- input: str
- output: str

**Examples**

Nqn Ybirynpr => Ada Lovelace

**Data Structures**

array of characters a-m
array of characters n-z

**Algorithm**

iterate through chars of input
inverse each char

how do we inverse each char?


=end

def rot(str)
  str.chars.map do |char|
    rot_inverse(char)
  end.join
end

def rot_inverse(char)
  am = ('a'..'m').to_a
  nz = ('n'..'z').to_a

  case char
  when ("a".."m") then nz[am.index(char)]
  when ("n".."z") then am[nz.index(char)]
  when ("A".."M") then nz[am.index(char.downcase)].upcase
  when ("N".."Z") then am[nz.index(char.downcase)].upcase
  else char
  end
end

# p rot("Nqn Ybirynpr")
# p rot("Tenpr Ubccre")
# p rot("Nqryr Tbyqfgvar")
# p rot("Nyna Ghevat")

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot(encrypted_name)
end