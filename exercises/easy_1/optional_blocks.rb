def compute(arg)
  block_given? ? yield(arg) : "#{arg}"
end
  
p compute(2) {|int| 2 + int} == 4
p compute('a') {|str| str + 'b'} == 'ab'
p compute('no block call') == 'no block call'